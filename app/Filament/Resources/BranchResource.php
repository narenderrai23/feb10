<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BranchResource\Pages;
use App\Filament\Resources\BranchResource\RelationManagers;
use App\Models\Branch;
use App\Models\Country;
use App\Models\State;
use App\Models\City;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Group;
use Illuminate\Support\Collection;
use Filament\Forms\Get;
use Filament\Forms\Set;

class BranchResource extends Resource
{
    protected static ?string $model = Branch::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-library';

    // protected static ?string $navigationGroup = 'Branch';
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Group::make()
                    ->schema([
                        Section::make()
                            ->schema([
                                TextInput::make('name')
                                    ->required()
                                    ->maxLength(255)
                                    ->required(),
                                TextInput::make('head')
                                    ->required()
                                    ->maxLength(255),
                                DatePicker::make('till_date')
                                    ->placeholder('2023-04-30')
                                    ->label('Valid Till Date')
                                    ->native(false)
                                    ->required(),
                                TextInput::make('phone')
                                    ->label('Phone number')
                                    ->tel()
                                    ->prefix('+91')
                                    ->telRegex('/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$/'),
                                Textarea::make('address')->required(),
                                TextInput::make('email')
                                    ->label('Email address')
                                    ->email()
                                    ->required()
                                    ->maxLength(255),
                                TextInput::make('password')
                                    ->label('Password')
                                    ->password()
                                    ->minLength(5)
                                    ->revealable()
                                    ->required(),
                            ])
                    ])->columnSpan(['lg' => 2]),

                Group::make()
                    ->schema([
                        Section::make()
                            ->schema([
                                Select::make('country_id')
                                    ->label('Country')
                                    ->options(fn (Get $get): Collection => Country::query()
                                        ->pluck('name', 'id'))
                                    ->live()
                                    ->searchable()
                                    ->default(1)
                                    ->required(),
                                Select::make('state_id')
                                    ->label('State')
                                    ->options(fn (Get $get): Collection => State::query()
                                        ->where('country_id', $get('country_id'))
                                        ->pluck('name', 'id'))
                                    ->live()
                                    ->searchable()
                                    ->afterStateUpdated(fn (callable $set) => $set('city_id', null))->searchable()
                                    ->required(),
                                Select::make('city_id')
                                    ->label('City')
                                    ->options(fn (Get $get): Collection => City::query()
                                        ->where('state_id', $get('state_id'))
                                        ->pluck('name', 'id'))
                                    ->required()
                                    ->live()
                                    ->searchable()
                                    ->afterStateUpdated(function (Set $set, $state) {
                                        $state = City::find($state);
                                        $lastId = Branch::latest()->value('id') + 1 ?? 1;
                                        $data = $state->city_code . date('Ymd') . str_pad($lastId, 3, '0', STR_PAD_LEFT);
                                        $set('code', $data);
                                    }),
                                TextInput::make('code')
                                    ->label('Branch Code')
                                    ->readonly()
                                    ->required(),
                                Select::make('branch_category_id')
                                    ->relationship('branch_category', 'name')
                                    ->required(),
                                Textarea::make('corresponding_address'),
                            ])
                    ])->columnSpan(['lg' => 1])
            ])->columns(3);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('code')->sortable()->searchable(),
                TextColumn::make('name')->sortable()->searchable(),
                TextColumn::make('head'),
                TextColumn::make('city.name')->sortable(),
                TextColumn::make('created_at')->dateTime(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBranches::route('/'),
            'create' => Pages\CreateBranch::route('/create'),
            'edit' => Pages\EditBranch::route('/{record}/edit'),
        ];
    }
}

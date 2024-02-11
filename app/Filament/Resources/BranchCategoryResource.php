<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BranchCategoryResource\Pages;
use App\Models\BranchCategory;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Forms\Components\Toggle;

class BranchCategoryResource extends Resource
{
    protected static ?string $model = BranchCategory::class;
    protected static ?string $navigationGroup = 'Helper';
    protected static ?string $navigationIcon = 'heroicon-o-square-2-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                    ->schema([
                        TextInput::make('name')
                            ->required(),
                        Toggle::make('status')
                            ->onColor('success')
                            ->offColor('danger')
                            ->label('Visible')
                            ->helperText('This product will be hidden from all sales channels.')
                            ->default(true)
                    ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('name')->sortable()->searchable(),
                ToggleColumn::make('status'),
                TextColumn::make('created_at')->dateTime()
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
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBranchCategories::route('/'),
            'create' => Pages\CreateBranchCategory::route('/create'),
            'edit' => Pages\EditBranchCategory::route('/{record}/edit'),
        ];
    }
}

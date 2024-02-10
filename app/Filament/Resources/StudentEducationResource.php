<?php

namespace App\Filament\Resources;

use App\Filament\Resources\StudentEducationResource\Pages;
use App\Filament\Resources\StudentEducationResource\RelationManagers;
use App\Models\StudentEducation;
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

class StudentEducationResource extends Resource
{
    protected static ?string $model = StudentEducation::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Student';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                    ->schema([
                        TextInput::make('name'),
                        Toggle::make('status')
                                    ->onColor('success')
                                    ->offColor('danger')
                                    ->label('Visible')
                                    ->default(true)
                    ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('name'),
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
            'index' => Pages\ListStudentEducation::route('/'),
            'create' => Pages\CreateStudentEducation::route('/create'),
            'edit' => Pages\EditStudentEducation::route('/{record}/edit'),
        ];
    }
}

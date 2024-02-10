<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CourseStatusResource\Pages;
use App\Filament\Resources\CourseStatusResource\RelationManagers;
use App\Models\CourseStatus;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;


use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Forms\Components\Toggle;

class CourseStatusResource extends Resource
{
    protected static ?string $model = CourseStatus::class;
    protected static ?string $navigationGroup = 'Course';

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

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
            'index' => Pages\ListCourseStatuses::route('/'),
            'create' => Pages\CreateCourseStatus::route('/create'),
            'edit' => Pages\EditCourseStatus::route('/{record}/edit'),
        ];
    }
}

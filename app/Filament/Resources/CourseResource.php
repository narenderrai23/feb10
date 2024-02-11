<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CourseResource\Pages;
use App\Models\Course;

use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Textarea;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Forms\Components\Toggle;
use Filament\Tables\Columns\Layout\Split;
use Filament\Tables\Columns\ColumnGroup;

class CourseResource extends Resource
{
    protected static ?string $model = Course::class;

    protected static ?string $navigationIcon = 'heroicon-o-book-open';
    // protected static ?string $navigationGroup = 'Course';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                    ->schema([
                        TextInput::make('name')->label('Course Full Name'),
                        TextInput::make('course_code')->label('Course Code'),
                        TextInput::make('course_duration')->numeric(),
                        Select::make('duration_id')->relationship('duration', 'name'),
                        TextInput::make('total_fee')->label('Course Fee')->numeric(),
                        Select::make('course_type_id')->relationship('course_type', 'name'),
                        Select::make('course_category_id')->relationship('course_category', 'name'),
                        Textarea::make('other_details'),
                        Textarea::make('eligibility'),
                        Toggle::make('status')
                            ->onColor('success')
                            ->offColor('danger')
                            ->label('Visible')
                            ->default(true)
                    ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        // dd(($table));
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('name'),
                TextColumn::make('course_code'),
                ColumnGroup::make('Course Duration', [
                    TextColumn::make('course_duration')->label('Time'),
                    TextColumn::make('duration.name'),
                ]),
                TextColumn::make('total_fee'),
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
            'index' => Pages\ListCourses::route('/'),
            'create' => Pages\CreateCourse::route('/create'),
            'edit' => Pages\EditCourse::route('/{record}/edit'),
        ];
    }
}

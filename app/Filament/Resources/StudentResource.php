<?php

namespace App\Filament\Resources;

use App\Filament\Resources\StudentResource\Pages;
use App\Filament\Resources\StudentResource\RelationManagers;
use App\Models\Student;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

use App\Models\Branch;
use App\Models\Course;
use App\Models\Gender;

use App\Models\Country;
use App\Models\State;
use App\Models\City;
use App\Models\CourseStatus;
use App\Models\Education;

use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Textarea;
use Illuminate\Support\Collection;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Forms\Components\FileUpload;
use Filament\Tables\Columns\SelectColumn;
use Filament\Notifications\Notification;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Columns\ImageColumn;

class StudentResource extends Resource
{
    protected static ?string $model = Student::class;
    // protected static ?string $navigationGroup = 'Student';
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Branch / Student Details')
                    ->schema([
                        DatePicker::make('date_admission')
                            ->native(false)
                            ->default('today'),
                        Select::make('branch_id')
                            ->label('Branch')
                            ->options(fn (Get $get): Collection => Branch::query()
                                ->pluck('name', 'id'))
                            ->live()
                            ->searchable()
                            ->afterStateUpdated(function (Set $set, $state) {
                                if ($state) {
                                    $branchCode = Branch::find($state);
                                    $set('enrollment', $branchCode->code);
                                } else {
                                    $set('enrollment', '');
                                }
                            })
                            ->required(),
                        TextInput::make('enrollment')
                            ->required()
                            ->readonly()
                            ->maxLength(255),
                    ])->columns(3),
                Section::make('Course Details')
                    ->description('Put the Course Details in.')
                    ->schema([
                        Select::make('course_id')
                            ->label('Course')
                            ->options(fn (Get $get): Collection => Course::query()
                                ->pluck('course_code', 'id'))
                            ->live()
                            ->searchable()
                            ->afterStateUpdated(function (Set $set, $state) {
                                if ($state) {
                                    $courses = Course::find($state);
                                    $set('course', $courses->name);
                                } else {
                                    $set('course', '');
                                }
                            })
                            ->required(),
                        TextInput::make('course')
                            ->required()
                            ->readonly()
                            ->maxLength(255),
                    ])->columns(2),
                Section::make('Basic Information')
                    ->schema([
                        TextInput::make('name')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('father_name')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('father_occupation')
                            ->required()
                            ->maxLength(255),

                        DatePicker::make('student_dob')
                            ->native(false)
                            ->required(),

                        Select::make('gender_id')
                            ->label('Gender')
                            ->options(fn (Get $get): Collection => Gender::query()
                                ->pluck('name', 'id'))
                            ->live()
                            ->searchable()
                            ->required(),

                        TextInput::make('phone')
                            ->label('Phone number')
                            ->tel()
                            ->prefix('+91')
                            ->telRegex('/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$/'),
                        FileUpload::make('profile_image')
                    ])->columns(3),
                Section::make('Contact Information')
                    ->schema([
                        Textarea::make('address1')
                            ->label('Address (Line1)')
                            ->required(),
                        Textarea::make('address2')
                            ->label('Address (Line2)')
                            ->required(),
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
                            ->searchable(),
                        TextInput::make('email')
                            ->label('Email address')
                            ->email()
                            ->required()
                            ->maxLength(255),
                        TextInput::make('student_whatsapp_phone')
                            ->label('Whatsapp number')
                            ->tel()
                            ->prefix('+91')
                            ->telRegex('/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$/'),
                        Select::make('course_status_id')
                            ->label('Status')
                            ->options(fn (Get $get): Collection => CourseStatus::query()
                                ->pluck('name', 'id'))
                            ->live()
                            ->default(1)
                            ->searchable()
                            ->required(),
                    ])->columns(2),
                Section::make('Contact Information')
                    ->schema([
                        Select::make('education_id')
                            ->label('Education')
                            ->options(fn (Get $get): Collection => Education::query()
                                ->pluck('name', 'id'))
                            ->live()
                            ->searchable()
                            ->required(),
                    ])->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                // ImageColumn::make('profile_image')
                // ->checkFileExistence(false)
                // ->defaultImageUrl(url('/images/placeholder.png')),
                TextColumn::make('id')->sortable(),
                TextColumn::make('enrollment'),
                TextColumn::make('name'),
                TextColumn::make('branch.name'),
                TextColumn::make('course.course_code'),
                SelectColumn::make('course_status_id')
                    ->options(fn (Get $get): Collection => CourseStatus::query()
                        ->pluck('name', 'id'))
                    ->label('Status')
                    ->selectablePlaceholder(false)
                    ->afterStateUpdated(function ($record, $state) {
                        Notification::make()
                            ->title('Update Status')
                            ->success()
                            ->iconColor('success')
                            ->send();
                    }),
                TextColumn::make('created_at')->dateTime()
            ])
            ->filters([
                // SelectFilter::make('branch')->relationship('branch', 'name')
                SelectFilter::make('branch')
                    ->relationship('branch', 'name')
                    ->searchable()
                    ->preload()
                    ->multiple()
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
            'index' => Pages\ListStudents::route('/'),
            'create' => Pages\CreateStudent::route('/create'),
            'edit' => Pages\EditStudent::route('/{record}/edit'),
        ];
    }
}

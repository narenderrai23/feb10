<?php

namespace App\Filament\Imports;

use App\Models\Course;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;

class CourseImporter extends Importer
{
    protected static ?string $model = Course::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('id')
                ->requiredMapping()
                ->numeric()
                ->rules(['integer'])
                ->ignoreBlankState(),
            ImportColumn::make('duration_id')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('course_category_id')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('course_type_id')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('name')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('course_code')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('total_fee')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('eligibility')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('course_duration')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('other_details')
                ->rules(['max:255']),
            ImportColumn::make('status')
                ->requiredMapping()
                ->boolean()
                ->rules(['required', 'boolean']),
        ];
    }

    public function resolveRecord(): ?Course
    {
        return Course::firstOrNew([
            // Update existing records, matching them by `$this->data['column_name']`
            'id' => $this->data['id'],
        ]);

        // return new Course();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your course import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}

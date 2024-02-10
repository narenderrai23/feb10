<?php

namespace App\Filament\Imports;

use App\Models\BranchCategory;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;

class BranchCategoryImporter extends Importer
{
    protected static ?string $model = BranchCategory::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('id')
                ->requiredMapping()
                ->numeric()
                ->rules(['max:255']),
            ImportColumn::make('name')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('status')
                ->requiredMapping()
                ->boolean()
                ->rules(['boolean']),
        ];
    }

    public function resolveRecord(): ?BranchCategory
    {
        return BranchCategory::firstOrNew([
            // Update existing records, matching them by `$this->data['column_name']`
            'id' => $this->data['id'],
        ]);

        // return new BranchCategory();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your branch category import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}

<?php

namespace App\Filament\Imports;

use App\Models\Branch;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;

class BranchImporter extends Importer
{
    protected static ?string $model = Branch::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('country_id')
                ->requiredMapping()
                ->numeric()
                ->rules(['integer']),
            ImportColumn::make('state_id')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('city_id')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('branch_category_id')
                ->requiredMapping()
                ->numeric()
                ->rules(['required', 'integer']),
            ImportColumn::make('code')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('name')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('head')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('phone')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('till_date')
                ->requiredMapping()
                ->rules(['required', 'date']),
            ImportColumn::make('address')
                ->requiredMapping()
                ->rules(['required', 'max:65535']),
            ImportColumn::make('corresponding_address')
                ->requiredMapping()
                ->rules(['required', 'max:65535']),
            ImportColumn::make('email')
                ->requiredMapping()
                ->rules(['required', 'email', 'max:255']),
            ImportColumn::make('profile_image')
                ->rules(['max:255']),
            ImportColumn::make('password')
                ->requiredMapping()
                ->rules(['required', 'max:255']),
            ImportColumn::make('status')
                ->requiredMapping()
                ->boolean()
                ->rules(['required', 'boolean']),
        ];
    }

    public function resolveRecord(): ?Branch
    {
        // return Branch::firstOrNew([
        //     // Update existing records, matching them by `$this->data['column_name']`
        //     'email' => $this->data['email'],
        // ]);

        return new Branch();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your branch import has completed and ' . number_format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}

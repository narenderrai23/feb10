<?php

namespace App\Filament\Resources\BranchCategoryResource\Pages;

use App\Filament\Resources\BranchCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Actions\ExportAction;
use App\Filament\Exports\BranchCategoryExporter;
use App\Filament\Imports\BranchCategoryImporter;
use Filament\Actions\ImportAction;

class ListBranchCategories extends ListRecords
{
    protected static string $resource = BranchCategoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ExportAction::make()
                ->exporter(BranchCategoryExporter::class),
            ImportAction::make()
                ->importer(BranchCategoryImporter::class),
        ];
    }
}

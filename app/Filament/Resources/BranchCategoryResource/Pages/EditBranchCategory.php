<?php

namespace App\Filament\Resources\BranchCategoryResource\Pages;

use App\Filament\Resources\BranchCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBranchCategory extends EditRecord
{
    protected static string $resource = BranchCategoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

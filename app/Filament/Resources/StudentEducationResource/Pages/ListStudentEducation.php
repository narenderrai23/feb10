<?php

namespace App\Filament\Resources\StudentEducationResource\Pages;

use App\Filament\Resources\StudentEducationResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListStudentEducation extends ListRecords
{
    protected static string $resource = StudentEducationResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}

<?php

namespace App\Filament\Resources\CourseStatusResource\Pages;

use App\Filament\Resources\CourseStatusResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCourseStatuses extends ListRecords
{
    protected static string $resource = CourseStatusResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}

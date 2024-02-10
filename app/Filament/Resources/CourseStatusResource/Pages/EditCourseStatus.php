<?php

namespace App\Filament\Resources\CourseStatusResource\Pages;

use App\Filament\Resources\CourseStatusResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCourseStatus extends EditRecord
{
    protected static string $resource = CourseStatusResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

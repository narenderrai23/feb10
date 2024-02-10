<?php

namespace App\Filament\Resources\StudentResource\Pages;

use App\Filament\Resources\StudentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Filament\Notifications\Actions\Action;
use Filament\Notifications\Notification;

class CreateStudent extends CreateRecord
{
    protected static string $resource = StudentResource::class;

    // protected function beforeCreate(): void
    // {
    //     Notification::make()
    //         ->warning()
    //         ->title('You don\'t have an active subscription!')
    //         ->body('Choose a plan to continue.')
    //         ->persistent()
    //         ->send();
    //     $this->halt();
    // }
}

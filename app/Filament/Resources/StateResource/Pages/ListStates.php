<?php

namespace App\Filament\Resources\StateResource\Pages;

use App\Filament\Resources\StateResource;
use App\Imports\ImportStates;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Livewire\WithFileUploads;
use Filament\Actions\ExportAction;
use Filament\Actions\ImportAction;
use App\Filament\Imports\StateImporter;
use App\Filament\Exports\StateExporter;

class ListStates extends ListRecords
{
    use WithFileUploads;
    public $excelFile;


    protected static string $resource = StateResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ImportAction::make()
                ->importer(StateImporter::class),
            ExportAction::make()
                ->exporter(StateExporter::class)
        ];
    }

   

    public function save()
    {
        $this->validate([
            'excelFile' => 'file|mimes:xlsx,xls,csv',
        ]);

        $extension = $this->excelFile->getClientOriginalExtension();
        $currentDateTime = now()->timezone('Asia/Kolkata')->format('Y-m-d_h-i-s');


        $filename = 'states_' . $currentDateTime . '.' . $extension;
        $path = $this->excelFile->storeAs('excels', $filename);
        Excel::import(new ImportStates, storage_path('app/' . $path));

        return redirect()->back()->with('success', 'States imported successfully!');
    }
}

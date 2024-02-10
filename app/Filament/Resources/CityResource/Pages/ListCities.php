<?php

namespace App\Filament\Resources\CityResource\Pages;

use App\Filament\Resources\CityResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Livewire\WithFileUploads;
use App\Imports\ImportCities;
use Filament\Actions\ExportAction;
use Filament\Actions\ImportAction;
use App\Filament\Imports\CityImporter;
use App\Filament\Exports\CityExporter;

class ListCities extends ListRecords
{
    use WithFileUploads;
    public $excelFile;
    protected static string $resource = CityResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ImportAction::make()
                ->importer(CityImporter::class),
            ExportAction::make()
                ->exporter(CityExporter::class)
        ];
    }

   


    public function save()
    {
        $this->validate([
            'excelFile' => 'file|mimes:xlsx,xls,csv'
        ]);

        $extension = $this->excelFile->getClientOriginalExtension();
        $currentDateTime = now()->timezone('Asia/Kolkata')->format('Y-m-d_h-i-s');


        $filename = 'cities_' . $currentDateTime . '.' . $extension;
        $path = $this->excelFile->storeAs('excels', $filename);
        Excel::import(new ImportCities, storage_path('app/' . $path));

        return redirect()->back()->with('success', 'Cities imported successfully!');
    }
}

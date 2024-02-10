<?php

namespace App\Filament\Resources\CountryResource\Pages;

use App\Filament\Resources\CountryResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Livewire\WithFileUploads;
use App\Imports\ImportCountry;
use Filament\Actions\ExportAction;
use Filament\Actions\ImportAction;
use App\Filament\Imports\CountryImporter;
use App\Filament\Exports\CountryExporter;
class ListCountries extends ListRecords
{
    use WithFileUploads;
    public $excelFile;

    protected static string $resource = CountryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ImportAction::make()
                ->importer(CountryImporter::class),
            ExportAction::make()
                ->exporter(CountryExporter::class)
        ];
    }

    

    public function save()
    {
        $this->validate([
            'excelFile' => 'file|mimes:xlsx,xls,csv'
        ]);

        $extension = $this->excelFile->getClientOriginalExtension();
        $currentDateTime = now()->timezone('Asia/Kolkata')->format('Y-m-d_h-i-s');


        $filename = 'Country_' . $currentDateTime . '.' . $extension;
        $path = $this->excelFile->storeAs('excels', $filename);
        Excel::import(new ImportCountry, storage_path('app/' . $path));

        return redirect()->back()->with('success', 'Cities imported successfully!');

        // unlink(storage_path('app/' . $path));
    }
}

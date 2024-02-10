<?php

namespace App\Filament\Resources\BranchResource\Pages;

use App\Filament\Resources\BranchResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Livewire\WithFileUploads;
use App\Imports\ImportBranch;
use Filament\Actions\ExportAction;
use Filament\Actions\ImportAction;
use App\Filament\Imports\BranchImporter;
use App\Filament\Exports\BranchExporter;

class ListBranches extends ListRecords
{
    use WithFileUploads;
    public $excelFile;


    protected static string $resource = BranchResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ImportAction::make()
                ->importer(BranchImporter::class),
            ExportAction::make()
                ->exporter(BranchExporter::class)
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
        Excel::import(new ImportBranch, storage_path('app/' . $path));

        return redirect()->back()->with('success', 'Cities imported successfully!');
    }
}

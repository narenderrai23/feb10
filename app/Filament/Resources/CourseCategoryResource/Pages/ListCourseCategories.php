<?php

namespace App\Filament\Resources\CourseCategoryResource\Pages;

use App\Filament\Resources\CourseCategoryResource;
use App\Imports\ImportCourseCategory;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Livewire\WithFileUploads;
use Filament\Actions\ExportAction;
use Filament\Actions\ImportAction;
use App\Filament\Imports\CourseCategoryImporter;
use App\Filament\Exports\CourseCategoryExporter;

class ListCourseCategories extends ListRecords
{
    protected static string $resource = CourseCategoryResource::class;
    public $excelFile;


    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ImportAction::make()
                ->importer(CourseCategoryImporter::class),
            ExportAction::make()
                ->exporter(CourseCategoryExporter::class)
        ];
    }

   

    public function save()
    {
        $this->validate([
            'excelFile' => 'file|mimes:xlsx,xls,csv'
        ]);

        $extension = $this->excelFile->getClientOriginalExtension();
        $currentDateTime = now()->timezone('Asia/Kolkata')->format('Y-m-d_h-i-s');


        $filename = 'CourseCategory_' . $currentDateTime . '.' . $extension;
        $path = $this->excelFile->storeAs('excels', $filename);
        Excel::import(new ImportCourseCategory, storage_path('app/' . $path));
    }
}

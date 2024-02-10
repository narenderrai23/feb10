<?php

namespace App\Filament\Resources\CourseResource\Pages;

use App\Filament\Resources\CourseResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Livewire\WithFileUploads;
use App\Imports\ImportCourse;
use Filament\Actions\ExportAction;
use Filament\Actions\ImportAction;
use App\Filament\Imports\CourseImporter;
use App\Filament\Exports\CourseExporter;
class ListCourses extends ListRecords
{
    use WithFileUploads;

    public $excelFile;

    protected static string $resource = CourseResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            ImportAction::make()
                ->importer(CourseImporter::class),
            ExportAction::make()
                ->exporter(CourseExporter::class)
        ];
    }

   

    public function save()
    {
        $this->validate([
            'excelFile' => 'file|mimes:xlsx,xls,csv'
        ]);

        $extension = $this->excelFile->getClientOriginalExtension();
        $currentDateTime = now()->timezone('Asia/Kolkata')->format('Y-m-d_h-i-s');


        $filename = 'Course_' . $currentDateTime . '.' . $extension;
        $path = $this->excelFile->storeAs('excels', $filename);
        Excel::import(new ImportCourse, storage_path('app/' . $path));

        return redirect()->back()->with('success', 'Cities imported successfully!');

        // unlink(storage_path('app/' . $path));
    }
}

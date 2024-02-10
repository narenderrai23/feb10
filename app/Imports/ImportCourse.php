<?php

namespace App\Imports;

use App\Models\Course;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ImportCourse implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        $data = [
            'name' => $row['name'],
            'course_code' => $row['course_code'],
            'total_fee' => $row['total_fee'],
            'eligibility' => $row['eligibility'],
            'course_duration' => $row['course_duration'],
            'duration_id' => $row['duration_id'],
            'course_category_id' => $row['course_category_id'],
            'course_type_id' => $row['course_type_id'],
            // 'other_details' => $row['other_details'],
        ];

        if (isset($row['id'])) {
            $data['id'] = $row['id'];
        }

        if (isset($row['status'])) {
            $data['status'] = $row['status'];
        }
        return new Course($data);
    }
}

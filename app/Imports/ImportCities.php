<?php

namespace App\Imports;

use App\Models\City;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ImportCities implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        $data = [
            'state_id' => $row['state_id'],
            'city_code' => $row['city_code'],
            'name' => $row['name'],
        ];

        // Check if 'id' is defined in the Excel row before adding it to $data
        if (isset($row['id'])) {
            $data['id'] = $row['id'];
        }

        if (isset($row['status'])) {
            $data['status'] = $row['status'];
        }

        return new City($data);
    }
}

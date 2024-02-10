<?php

namespace App\Imports;

use App\Models\Country;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ImportCountry implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        $data = [
            'country_code' => $row['country_code'],
            'name' => $row['name'],
        ];

        // Check if 'id' is defined in the Excel row before adding it to $data
        if (isset($row['id'])) {
            $data['id'] = $row['id'];
        }

        if (isset($row['status'])) {
            $data['status'] = $row['status'];
        }

        return new Country($data);
    }
}

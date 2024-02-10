<?php

namespace App\Imports;

use App\Models\Branch;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ImportBranch implements ToModel, WithHeadingRow
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
            'city_id' => $row['city_id'],
            'code' => $row['code'],
            'head' => $row['head'],
            'name' => $row['name'],
            'branch_category_id' => $row['branch_category_id'],
            'phone' => $row['phone'],
            'till_date' => $row['till_date'],
            'address' => $row['address'],
            'corresponding_address' => $row['corresponding_address'],
            'email' => $row['email'],
            'password' => $row['password'],
        ];

        if (isset($row['id'])) {
            $data['id'] = $row['id'];
        }

        if (isset($row['status'])) {
            $data['status'] = $row['status'];
        }

        return new Branch($data);
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;

    protected $fillable = [
        'country_id',
        'state_id',
        'city_id',
        'code',
        'head',
        'name',
        'branch_category_id',
        'phone',
        'till_date',
        'address',
        'corresponding_address',
        'email',
        'password',
        'status'
    ];

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function branch_category()
    {
        return $this->belongsTo(BranchCategory::class);
    }

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}

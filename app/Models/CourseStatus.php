<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourseStatus extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}

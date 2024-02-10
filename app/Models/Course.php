<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'course_code',
        'total_fee',
        'eligibility',
        'course_duration',
        'duration_id',
        'course_category_id',
        'course_type_id',
        'other_details',
        'status'
    ];


    public function duration()
    {
        return $this->belongsTo(Duration::class);
    }

    public function course_category()
    {
        return $this->belongsTo(CourseCategory::class);
    }

    public function course_type()
    {
        return $this->belongsTo(CourseType::class);
    }

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}

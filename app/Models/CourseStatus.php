<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class CourseStatus extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    public function student(): HasMany
    {
        return $this->hasMany(Student::class);
    }
}

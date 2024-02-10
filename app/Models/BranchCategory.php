<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class BranchCategory extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    public function branch(): HasMany
    {
        return $this->hasMany(Branch::class);
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Benefits extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'sss',
        'tin',
        'pagibig',
        'philhealth',
        'salary',
        'saved'
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeFiles extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'filename',
        'file_description',
    ];
}

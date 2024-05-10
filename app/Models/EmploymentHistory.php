<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmploymentHistory extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'company_name',
        'position',
        'start_year',
        'end_year',
        'remarks',
        'saved'
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EducationalBackground extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'primary_school',
        'primary_start_year',
        'primary_end_year',
        'junior_school',
        'junior_start_year',
        'junior_end_year',
        'senior_school',
        'senior_start_year',
        'senior_end_year',
        'college_school',
        'college_course',
        'college_start_year',
        'college_end_year',
        'post_school',
        'post_course',
        'post_start_year',
        'post_end_year',
        'saved',
    ];
}

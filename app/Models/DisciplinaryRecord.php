<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DisciplinaryRecord extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'recorded_date',
        'incident_date',
        'violation_desc',
        'officer',
        'findings',
        'da_taken',
        'remarks',
        'saved'
    ];
}

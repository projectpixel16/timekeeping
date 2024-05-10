<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AppraisalsMovements extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'date_prepared',
        'business_unit_id',
        'department_id',
        'designation',
        'salary',
        'employee_status_id',
        'employee_progression_id',
        'remarks',
        'saved'
    ];

    public function department()
    {
        return $this->belongsTo(Departments::class, 'department_id');
    }
    public function business_unit()
    {
        return $this->belongsTo(BusinessUnits::class, 'business_unit_id');
    }

    public function employee_status()
    {
        return $this->belongsTo(EmployeeStatus::class, 'employee_status_id');
    }

    public function employee_progression()
    {
        return $this->belongsTo(EmployeeProgression::class, 'employee_progression_id');
    }
}

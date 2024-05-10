<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobProfile extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'employee_number',
        'designation',
        'supervisor_id',
        'department_id',
        'business_unit_id',
        'date_hired',
        'regularization_date',
        'termination_date',
        'employee_status_id',
        'active',
        'saved'
    ];

    public function employee_profile()
    {
        return $this->belongsTo(EmployeeProfile::class);
    }

    public function supervisor()
    {
        return $this->belongsTo(EmployeeProfile::class, 'supervisor_id');
    }

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

    
}

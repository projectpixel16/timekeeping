<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeProfile extends Model
{
    use HasFactory;
    protected $fillable = [
        'firstname',
        'middlename',
        'lastname',
        'photo',
        'contact_no',
        'email',
        'permanent_street',
        'permanent_brgy',
        'permanent_city',
        'permanent_province',
        'same_present_address',
        'present_street',
        'present_brgy',
        'present_city',
        'present_province',
        'date_of_birth',
        'place_of_birth',
        'sex',
        'civil_status',
        'nationality',
        'religion',
        'emer_contact_name',
        'emer_contact_no',
        'emer_contact_rel',
        'emer_contact_add',
        'employee_status_id',
        'user_id'
    ];

    public function job_profile()
    {
        return $this->hasOne(JobProfile::class, 'employee_profile_id', 'id');
    }

    public function timekeeping()
    {
        return $this->hasMany(Timekeeping::class, 'employee_profile_id', 'id');
    }

    public function employee_status()
    {
        return $this->belongsTo(EmployeeStatus::class, 'employee_status_id');
    }

  

}

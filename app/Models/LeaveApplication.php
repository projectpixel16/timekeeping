<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LeaveApplication extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'date_applied',
        'start_date',
        'end_date',
        'no_of_days',
        'no_of_hours',
        'leave_types_id',
        'cancelled',
        'cancelled_by',
        'cancelled_date',
        'cancelled_reason',
        'reason',
    ];

    public function employee_profile()
    {
        return $this->belongsTo(EmployeeProfile::class);
    }

    public function leave_types()
    {
        return $this->belongsTo(LeaveTypes::class,'leave_types_id');
    }
}

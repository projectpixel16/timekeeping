<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchedulingDetails extends Model
{
    use HasFactory;
    protected $table = 'scheduling_details';
    protected $fillable = [
        'scheduling_head_id',
        'employee_profile_id',
        'overtime',
        'saved'
    ];

    public function employee_profile()
    {
        return $this->belongsTo(EmployeeProfile::class, 'employee_profile_id');
    }

    public function scheduling_head()
    {
        return $this->belongsTo(SchedulingHead::class);
    }

}

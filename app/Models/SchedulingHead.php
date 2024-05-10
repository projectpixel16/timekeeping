<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchedulingHead extends Model
{
    use HasFactory;
    protected $table = 'scheduling_head';
    protected $fillable = [
        'work_schedules_id',
        'start_date',
        'end_date',
        'minimum_hours',
        'saved'
    ];

    
    public function scheduling_details(){
        return $this->hasMany(SchedulingDetails::class);
    }

    public function work_schedules(){
        return $this->belongsTo(WorkSchedules::class,'work_schedules_id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WorkSchedules extends Model
{
    use HasFactory;
    protected $fillable = [
        'schedule_code',
        'schedule_type',
        'start_time',
        'end_time'
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Holidays extends Model
{
    use HasFactory;
    protected $fillable = [
        'business_calendar_id',
        'holiday_type_id',
        'holiday_date',
        'holiday_name'
    ];
}

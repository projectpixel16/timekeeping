<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TrainingsSeminars extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'title',
        'venue',
        'organizer',
        'training_date',
        'remarks',
        'saved'
    ];
}

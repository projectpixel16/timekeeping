<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EvaluationHistory extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'evaluation_date',
        'evaluation_type_id',
        'score',
        'remarks',
        'saved'
    ];

    public function evaluation_type()
    {
        return $this->belongsTo(EvaluationType::class, 'evaluation_type_id');
    }
    
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AppraisalsAllowances extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'appraisals_movement_id',
        'allowance_lists_id',
        'amount',
        'saved'
    ];

    public function allowance_list()
    {
        return $this->belongsTo(AllowanceList::class, 'allowance_lists_id');
    }
}

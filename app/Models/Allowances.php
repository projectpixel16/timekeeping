<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Allowances extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'allowance_list_id',
        'amount',
    ];

    public function allowance_list()
    {
        return $this->belongsTo(AllowanceList::class, 'allowance_list_id');
    }
}

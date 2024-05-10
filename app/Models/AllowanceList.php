<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AllowanceList extends Model
{
    use HasFactory;
    protected $fillable = [
        'allowance_name'
    ];
}

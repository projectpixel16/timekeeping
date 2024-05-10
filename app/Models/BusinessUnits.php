<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BusinessUnits extends Model
{
    use HasFactory;
    protected $table = "business_units";
    protected $fillable = [
        'bu_name',
        'address',
        'contact_no'
    ];
}

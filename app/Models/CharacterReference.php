<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CharacterReference extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'fullname',
        'employer',
        'position',
        'relationship',
        'contact_no',
        'saved'
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CertificationsLicenses extends Model
{
    use HasFactory;
    protected $fillable = [
        'employee_profile_id',
        'certification_name',
        'issuing_org',
        'date_taken',
        'expiration_date',
        'remarks',
        'saved'
    ];
}

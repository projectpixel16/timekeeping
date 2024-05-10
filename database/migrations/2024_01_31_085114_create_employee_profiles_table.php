<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('employee_profiles', function (Blueprint $table) {
            $table->id();
            $table->string('firstname')->nullable();
            $table->string('middlename')->nullable();
            $table->string('lastname')->nullable();
            $table->string('photo')->nullable();
            $table->string('contact_no')->nullable();
            $table->string('email')->nullable();
            $table->string('permanent_street')->nullable();
            $table->string('permanent_brgy')->nullable();
            $table->string('permanent_city')->nullable();
            $table->string('permanent_province')->nullable();
            $table->string('permanent_country')->nullable();
            $table->string('present_street')->nullable();
            $table->string('present_brgy')->nullable();
            $table->string('present_city')->nullable();
            $table->string('present_province')->nullable();
            $table->string('present_country')->nullable();
            $table->string('date_of_birth')->nullable();
            $table->string('place_of_birth')->nullable();
            $table->string('sex')->nullable();
            $table->string('civil_status')->nullable();
            $table->string('nationality')->nullable();
            $table->string('religion')->nullable();
            $table->string('emer_contact_name')->nullable();
            $table->string('emer_contact_no')->nullable();
            $table->string('emer_contact_rel')->nullable();
            $table->string('emer_contact_add')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_profiles');
    }
};

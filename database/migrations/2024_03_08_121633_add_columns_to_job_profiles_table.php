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
        Schema::table('job_profiles', function (Blueprint $table) {
            $table->string('employee_number')->after('employee_profile_id');
            $table->integer('supervisor_id')->default(0)->nullable()->after('designation');
            $table->integer('active')->default(0)->after('employee_status_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('job_profiles', function (Blueprint $table) {
            //
        });
    }
};

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
        Schema::table('employee_profiles', function (Blueprint $table) {
            $table->integer('permanent_province')->default('0')->nullable()->change();
            $table->integer('permanent_city')->default('0')->nullable()->change();
            $table->integer('present_province')->default('0')->nullable()->change();
            $table->integer('present_city')->default('0')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('employee_profiles', function (Blueprint $table) {
            //
        });
    }
};

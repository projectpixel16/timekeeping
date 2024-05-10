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
            $table->integer('user_id')->default(0)->after('saved');
            $table->integer('permanent_province')->change();
            $table->integer('permanent_city')->change();
            $table->integer('present_province')->change();
            $table->integer('present_city')->change();

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

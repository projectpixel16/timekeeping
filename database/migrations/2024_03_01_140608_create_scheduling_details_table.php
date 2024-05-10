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
        Schema::create('scheduling_details', function (Blueprint $table) {
            $table->id();
            $table->integer('scheduling_head_id')->unsigned()->default(0);
            $table->integer('employee_profile_id')->unsigned()->default(0);
            $table->integer('overtime')->default(0)->comment('0 - no overtime pay, 1 = allow overtime pay');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('scheduling_details');
    }
};

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
        Schema::create('appraisals_allowances', function (Blueprint $table) {
            $table->id();
            $table->integer('appraisals_movement_id')->unsigned()->default(0);
            $table->integer('employee_profile_id')->unsigned()->default(0);
            $table->integer('allowance_lists_id')->unsigned()->default(0);
            $table->double('amount')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('appraisals_allowances');
    }
};

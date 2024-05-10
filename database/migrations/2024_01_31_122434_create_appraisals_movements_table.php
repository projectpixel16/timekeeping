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
        Schema::create('appraisals_movements', function (Blueprint $table) {
            $table->id();
            $table->integer('employee_profile_id')->unsigned()->default(0);
            $table->string('date_prepared')->nullable();
            $table->integer('business_unit_id')->unsigned()->default(0);
            $table->integer('department_id')->unsigned()->default(0);
            $table->string('designation')->nullable();
            $table->double('salary')->default(0);
            $table->integer('employee_status_id')->unsigned()->default(0);
            $table->integer('employee_progression_id')->unsigned()->default(0);
            $table->text('remarks')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('appraisals_movements');
    }
};

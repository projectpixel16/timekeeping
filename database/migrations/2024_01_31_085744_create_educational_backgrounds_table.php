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
        Schema::create('educational_backgrounds', function (Blueprint $table) {
            $table->id();
            $table->integer('employee_profile_id')->unsigned()->default(0);
            $table->string('primary_school')->nullable();
            $table->string('primary_start_year')->nullable();
            $table->string('primary_end_year')->nullable();
            $table->string('junior_school')->nullable();
            $table->string('junior_start_year')->nullable();
            $table->string('junior_end_year')->nullable();
            $table->string('senior_school')->nullable();
            $table->string('senior_start_year')->nullable();
            $table->string('senior_end_year')->nullable();
            $table->string('college_school')->nullable();
            $table->string('college_course')->nullable();
            $table->string('college_start_year')->nullable();
            $table->string('college_end_year')->nullable();
            $table->string('post_school')->nullable();
            $table->string('post_course')->nullable();
            $table->string('post_start_year')->nullable();
            $table->string('post_end_year')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('educational_backgrounds');
    }
};

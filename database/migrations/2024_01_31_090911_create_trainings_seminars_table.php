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
        Schema::create('trainings_seminars', function (Blueprint $table) {
            $table->id();
            $table->integer('employee_profile_id')->unsigned()->default(0);
            $table->string('title')->nullable();
            $table->string('venue')->nullable();
            $table->string('organizer')->nullable();
            $table->string('training_date')->nullable();
            $table->text('remarks')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trainings_seminars');
    }
};

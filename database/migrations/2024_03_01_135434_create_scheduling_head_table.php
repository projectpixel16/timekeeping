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
        Schema::create('scheduling_head', function (Blueprint $table) {
            $table->id();
            $table->integer('work_schedules_id')->unsigned()->default(0);
            $table->string('start_date')->nullable();
            $table->string('end_date')->nullable();
            $table->integer('minimum_hours')->default(0);
            $table->integer('saved')->default(0)->comment('0 - draft, 1 - saved');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('scheduling_head');
    }
};

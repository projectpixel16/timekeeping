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
        Schema::create('certifications_licenses', function (Blueprint $table) {
            $table->id();
            $table->integer('employee_profile_id')->unsigned()->default(0);
            $table->string('certification_name')->nullable();
            $table->string('issuing_org')->nullable();
            $table->string('date_taken')->nullable();
            $table->string('expiration_date')->nullable();
            $table->text('remarks')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('certifications_licenses');
    }
};

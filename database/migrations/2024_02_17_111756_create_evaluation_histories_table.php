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
        Schema::create('evaluation_histories', function (Blueprint $table) {
            $table->id();
            $table->integer('employee_profile_id')->unsigned()->default(0);
            $table->string('evaluation_date')->nullable();
            $table->integer('evaluation_type_id')->unsigned()->default(0);
            $table->string('score')->nullable();
            $table->text('remarks')->nullable();
            $table->integer('saved')->default(0)->comment('0 - draft, 1 - saved');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('evaluation_histories');
    }
};

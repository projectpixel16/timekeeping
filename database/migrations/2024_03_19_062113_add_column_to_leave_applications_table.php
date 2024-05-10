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
        Schema::table('leave_applications', function (Blueprint $table) {
            $table->integer('cancelled_by')->default('0')->after('cancelled')->nullable();
            $table->string('cancelled_date')->nullable()->after('cancelled_by');
            $table->string('cancelled_reason')->nullable()->after('cancelled_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('leave_applications', function (Blueprint $table) {
            //
        });
    }
};

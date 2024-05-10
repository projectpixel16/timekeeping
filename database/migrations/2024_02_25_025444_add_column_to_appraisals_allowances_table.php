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
        Schema::table('appraisals_allowances', function (Blueprint $table) {
            $table->integer('saved')->default(0)->after('amount')->comment('0 - draft, 1 - saved');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('appraisals_allowances', function (Blueprint $table) {
            //
        });
    }
};

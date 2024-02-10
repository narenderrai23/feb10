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
        Schema::create('student_data', function (Blueprint $table) {
            $table->id();
            // $table->integer('student_id')->unsigned();
            // $table->foreign('student_id')->references('id')->on('students')->onDelete('cascade');
            $table->foreignId('student_id')->constrained()->cascadeOnDelete();
            $table->string('qualification')->nullable();
            $table->string('board_university')->nullable();
            $table->string('year_of_passing')->nullable();
            $table->string('percentage')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('student_data');
    }
};

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
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('course_code');
            $table->decimal('total_fee', 10, 2);
            $table->string('eligibility');
            $table->integer('course_duration');
            $table->foreignId('duration_id')->constrained()->cascadeOnDelete();
            $table->foreignId('course_category_id')->constrained()->cascadeOnDelete();
            $table->foreignId('course_type_id')->constrained()->cascadeOnDelete();
            $table->string('other_details')->nullable();
            $table->boolean('status')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('courses');
    }
};

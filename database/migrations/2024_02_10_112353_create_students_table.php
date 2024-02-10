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
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->timestamp('date_admission')->useCurrent();
            $table->foreignId('branch_id')->constrained()->cascadeOnDelete();
            $table->string('enrollment');
            $table->foreignId('course_id')->constrained()->cascadeOnDelete();
            $table->string('course');
            $table->string('name');
            $table->string('father_name');
            $table->string('father_occupation');
            $table->date('student_dob');
            $table->foreignId('gender_id')->constrained()->cascadeOnDelete();
            $table->string('phone');
            $table->string('profile_image')->nullable();
            $table->string('address1');
            $table->string('address2');
            $table->foreignId('country_id')->constrained()->cascadeOnDelete();
            $table->foreignId('state_id')->constrained()->cascadeOnDelete();
            $table->foreignId('city_id')->constrained()->cascadeOnDelete();
            $table->string('email')->unique();
            $table->string('student_whatsapp_phone');
            $table->foreignId('course_status_id')->constrained()->cascadeOnDelete();
            $table->boolean('status')->default(true);
            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};

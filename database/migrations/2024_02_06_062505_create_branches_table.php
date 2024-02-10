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
        Schema::create('branches', function (Blueprint $table) {
            $table->id();
            $table->foreignId('country_id')->constrained()->cascadeOnDelete();
            $table->foreignId('state_id')->constrained()->cascadeOnDelete();
            $table->foreignId('city_id')->constrained()->cascadeOnDelete();
            $table->char('code');
            $table->string('name');
            $table->string('head');
            $table->foreignId('branch_category_id')->constrained()->cascadeOnDelete();
            $table->string('phone');
            $table->date('till_date');
            $table->text('address');
            $table->text('corresponding_address');
            $table->string('email')->unique();
            $table->string('profile_image')->nullable();
            $table->string('password');
            $table->boolean('status')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('branches');
    }
};

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
        Schema::create('stocks', function (Blueprint $table) {
            $table->id(); // ini auto_increment primary key
            $table->string('nama_produk', 100);
            $table->integer('jumlah'); // tanpa auto_increment
            $table->unsignedInteger('harga'); // tanpa auto_increment
            $table->timestamps();            // created_at dan updated_at otomatis ditambahkan
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stocks');
    }
};

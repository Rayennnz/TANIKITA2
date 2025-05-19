<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class alat extends Model
{
    protected $table = 'alats';
    protected $fillable = [
        'nama',
        'deskripsi',
        'stok',
        'gambar',
    ];
}
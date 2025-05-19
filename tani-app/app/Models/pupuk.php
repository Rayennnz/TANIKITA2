<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class pupuk extends Model
{
    protected $table = 'pupuks';
    protected $fillable = [
        'nama',
        'deskripsi',
        'stok',
        'gambar',
    ];
}

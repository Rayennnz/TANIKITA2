<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cuaca extends Model
{
    use HasFactory;
    
    protected $table = 'cuacas';

    protected $fillable = [
        'kota',
        'cuaca',
        'waktu',
        'tanggal',
        'jam',
    ];
}

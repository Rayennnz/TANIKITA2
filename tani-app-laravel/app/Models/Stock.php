<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Stock extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    protected $table = 'stocks';

    protected $fillable = [
        'nama_produk',
        'jumlah',
        'harga',
    ];

    /**
     * Register media collections
     */
    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('gambar-produk')->singleFile(); // satu gambar per produk
    }
}

<?php

namespace App\Filament\Widgets;

use App\Models\Stock;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;
use Filament\Widgets\StatsOverviewWidget\Stat;

class Pengiriman extends BaseWidget
{
    protected static ?string $pollingInterval = '30s'; // Optional, untuk auto refresh

    protected function getCards(): array
    {
        $totalProduk = Stock::count();
        $totalStok = Stock::sum('jumlah');
        $totalNilai = Stock::sum(\DB::raw('jumlah * harga'));
        $countAlat = \App\Models\Alat::count();
        $countObat = \App\Models\Obat::count();
        $countPupuk = \App\Models\Pupuk::count();

        return [
            Card::make('Total Produk', $totalProduk),
            Card::make('Total Stok', $totalStok),
            Card::make('Total Nilai Stok', 'Rp ' . number_format($totalNilai, 0, ',', '.')),
            Stat::make('Jumlah Alat', $countAlat, 'alat')
                ->description('Jumlah alat yang terdaftar')
                ->icon('heroicon-o-wrench')
                ->color('success'),
            Stat::make('Jumlah Obat', $countObat, 'obat')
                ->description('Jumlah obat yang terdaftar')
                ->icon('heroicon-o-cube')
                ->color('warning'),
            Stat::make('Jumlah Pupuk',$countPupuk, 'pupuk')
                ->description('Jumlah pupuk yang terdaftar')
                ->icon('heroicon-o-sparkles')
                ->color('danger'),
        ];
    }
}

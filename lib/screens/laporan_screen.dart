import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'detail_screen_laporan_tanam.dart';
import 'detail_screen_laporan_kontrol.dart'; // Tambahkan import ini
import 'detail_screen_laporan_panen.dart'; // Tambahkan import ini
import 'hasil_catatan_screen.dart'; // Tambahkan import ini

class LaporanScreen extends StatelessWidget {
  const LaporanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF90D4A9), Color(0xFF85DBFC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // Daftar laporan
              Expanded(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  children: [
                    LaporanCard(
                      title: 'Laporan Tanam',
                      dateTime: '3 mei 2024 - 18.12',
                      imagePath: 'assets/laporan.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DetailLaporanTanamScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    LaporanCard(
                      title: 'Laporan Kontrol',
                      dateTime: '3 mei 2024 - 18.12',
                      imagePath: 'assets/laporan.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DetailLaporanKontrolScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    LaporanCard(
                      title: 'Laporan Panen',
                      dateTime: '3 mei 2024 - 18.12',
                      imagePath: 'assets/laporan.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DetailLaporanPanenScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Tombol menuju halaman hasil catatan
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.list_alt),
                    label: const Text('Lihat Semua Catatan'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HasilCatatanScreen()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LaporanCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String imagePath;
  final VoidCallback? onTap; // Tambahkan ini

  const LaporanCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.imagePath,
    this.onTap, // Tambahkan ini
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap, // Tambahkan ini
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateTime,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HasilCatatanScreen extends StatelessWidget {
  const HasilCatatanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Di sini nanti Anda bisa menampilkan daftar hasil catatan dari laporan tanam, kontrol, panen
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Catatan Semua Laporan')),
      body: const Center(
        child: Text(
            'Daftar hasil catatan laporan tanam, kontrol, dan panen akan tampil di sini.'),
      ),
    );
  }
}

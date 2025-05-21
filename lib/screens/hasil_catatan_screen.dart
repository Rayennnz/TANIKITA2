import 'package:flutter/material.dart';

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

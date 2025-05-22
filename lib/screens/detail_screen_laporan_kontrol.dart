import 'package:flutter/material.dart';

class DetailLaporanKontrolScreen extends StatefulWidget {
  const DetailLaporanKontrolScreen({super.key});

  @override
  State<DetailLaporanKontrolScreen> createState() =>
      _DetailLaporanKontrolScreenState();
}

class _DetailLaporanKontrolScreenState
    extends State<DetailLaporanKontrolScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Laporan Kontrol')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Catatan Laporan Kontrol:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Tulis catatan laporan kontrol di sini...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simpan atau proses catatan di sini
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Catatan disimpan: ${_controller.text}')),
                );
              },
              child: const Text('Simpan Catatan'),
            ),
          ],
        ),
      ),
    );
  }
}

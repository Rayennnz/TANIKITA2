import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_detail_screen.dart';

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final int price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Product> allProducts = [
    Product(
      name: 'Pupuk Organik',
      description: 'Pupuk alami untuk kesuburan tanah.',
      imageUrl: 'https://via.placeholder.com/150', // HTTPS ya!
      price: 20000,
    ),
    Product(
      name: 'Pupuk Premium',
      description: 'Pupuk khusus tanaman buah dan sayur.',
      imageUrl: 'https://via.placeholder.com/150',
      price: 35000,
    ),
    Product(
      name: 'Cangkul',
      description: 'Alat pertanian untuk menggemburkan tanah.',
      imageUrl: 'https://via.placeholder.com/150',
      price: 50000,
    ),
    Product(
      name: 'Sekop',
      description: 'Sekop kecil untuk taman dan pot.',
      imageUrl: 'https://via.placeholder.com/150',
      price: 25000,
    ),
    Product(
      name: 'Obat Tikus',
      description: 'Mengusir hama tikus dari lahan.',
      imageUrl: 'https://via.placeholder.com/150',
      price: 15000,
    ),
    Product(
      name: 'Obat Penyakit Padi',
      description: 'Solusi untuk penyakit daun & batang padi.',
      imageUrl: 'https://via.placeholder.com/150',
      price: 30000,
    ),
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(allProducts);
    _searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredProducts = allProducts
          .where((product) => product.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Market',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: filteredProducts.map((product) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Tambahkan errorBuilder agar tidak crash
                          Image.network(
                            product.imageUrl,
                            width: 70,
                            height: 70,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, size: 70);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.name,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

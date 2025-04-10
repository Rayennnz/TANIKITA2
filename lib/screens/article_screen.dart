import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_button.dart';
import '../widgets/article_item.dart';
import 'home_screen.dart';

class artikelscreen extends StatelessWidget {
  const artikelscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF90D4A9), Color(0xFF85DBFC)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Logo and app name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  children: [
                    Image.asset(
                      'asset/1.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'TaniKita',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Back button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        ); // Kembali ke halaman sebelumnya
                      },
                      child: const Icon(
                        Icons.arrow_back, // Ikon kembali
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Artikel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Main content area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 9.0,
                    right: 9.0,
                    top: 20.0,
                  ),
                  child: Column(
                    children: [
                      // Search bar
                      const CustomSearchBar(),

                      // Category filters
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        height: 31,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CategoryButton(
                              label: 'Organik',
                              isSelected: true,
                            ),
                            SizedBox(width: 5),
                            CategoryButton(
                              label: 'Pupuk',
                              isSelected: false,
                            ),
                            SizedBox(width: 5),
                            CategoryButton(
                              label: 'Hama',
                              isSelected: false,
                            ),
                            SizedBox(width: 5),
                            CategoryButton(
                              label: 'Teknik Tanam',
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),

                      // Articles list
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 36.0),
                          child: ListView(
                            children: const [
                              ArticleItem(title: 'Artikel 1'),
                              ArticleItem(title: 'Artikel 2'),
                              ArticleItem(title: 'Artikel 3'),
                              ArticleItem(title: 'Artikel 4'),
                              ArticleItem(title: 'Artikel 5'),
                              ArticleItem(title: 'Artikel 6'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignalIcon() {
    return SizedBox(
      width: 23,
      height: 23,
      child: CustomPaint(
        painter: SignalIconPainter(),
      ),
    );
  }

  Widget _buildBatteryIcon() {
    return SizedBox(
      width: 26,
      height: 26,
      child: CustomPaint(
        painter: BatteryIconPainter(),
      ),
    );
  }

  Widget _buildWifiIcon() {
    return SizedBox(
      width: 26,
      height: 26,
      child: CustomPaint(
        painter: WifiIconPainter(),
      ),
    );
  }
}

class SignalIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw signal bars (simplified version)
    canvas.drawRect(
      Rect.fromLTWH(size.width - 12, size.height - 6, 2, 6),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width - 9, size.height - 9, 2, 9),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width - 6, size.height - 12, 2, 12),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width - 3, size.height - 15, 2, 15),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BatteryIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Paint fillPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Battery outline
    final RRect batteryBody = RRect.fromRectAndRadius(
      Rect.fromLTWH(2, 7.3, 17.5, 10),
      const Radius.circular(2),
    );

    // Battery tip
    final Rect batteryTip = Rect.fromLTWH(24.375, 8.9375, 1.625, 8.125);

    canvas.drawRRect(batteryBody, paint);
    canvas.drawRect(batteryTip, paint);

    // Battery fill level
    canvas.drawRRect(batteryBody, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WifiIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw wifi arcs (simplified)
    canvas.drawArc(
      Rect.fromLTWH(8, 8, 10, 10),
      3.14, // pi
      3.14, // pi
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromLTWH(6, 6, 14, 14),
      3.14, // pi
      3.14, // pi
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromLTWH(4, 4, 18, 18),
      3.14, // pi
      3.14, // pi
      false,
      paint,
    );

    // Draw dot at bottom
    final Paint dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height - 6),
      1.5,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

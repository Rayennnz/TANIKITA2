import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          // Search icon
          const Icon(
            Icons.search,
            size: 24,
            color: Colors.black,
          ),
          const SizedBox(width: 12),

          // Placeholder text
          const Expanded(
            child: Text(
              'Cari artikel...',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Inter',
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Draw back arrow
    path.moveTo(size.width * 0.9, size.height * 0.78);
    path.lineTo(size.width * 0.1, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.22);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SearchIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Draw search circle
    canvas.drawCircle(
      Offset(size.width * 0.4, size.height * 0.4),
      size.width * 0.25,
      paint,
    );

    // Draw search handle
    final Path path = Path();
    path.moveTo(size.width * 0.6, size.height * 0.6);
    path.lineTo(size.width * 0.85, size.height * 0.85);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

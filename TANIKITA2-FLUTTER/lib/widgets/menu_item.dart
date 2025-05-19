import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem extends StatelessWidget {
  final String svgIcon;
  final String label;
  final Color backgroundColor;

  const MenuItem({
    Key? key,
    required this.svgIcon,
    required this.label,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;

    return Column(
      children: [
        // Icon container
        Container(
          width: isSmallScreen ? 75 : 87,
          height: isSmallScreen ? 75 : 87,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.string(
              svgIcon,
              width: 60,
              height: 60,
            ),
          ),
        ),

        // Label
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final String title;

  const ArticleItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 93,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 1), // Small gap between items
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
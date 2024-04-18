import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String text;
  final Color color;

  const CustomBadge({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(255, 97, 98, 97),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
}

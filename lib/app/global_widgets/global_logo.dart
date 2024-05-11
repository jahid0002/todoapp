import 'package:flutter/material.dart';

class GlobalLogo extends StatelessWidget {
  const GlobalLogo({super.key, required this.radias, this.color});

  final double radias;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/right3.png',
          width: size.width * 0.30,
          height: size.width * 0.30,
          fit: BoxFit.cover,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:operator_forvia/style/colors.dart'; // Adjust the import if needed

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double lineHeight;

  const PrimaryText({
    Key? key, // Corrected here
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.primary, // Adjust the color import if needed
    this.size = 20,
    this.lineHeight = 1.3, // Changed height to lineHeight
  }) : super(key: key); // Corrected here

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: lineHeight, // Corrected here
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

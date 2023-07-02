import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCopy extends StatelessWidget {
  final text;
  final textcolor;
  const TextCopy({super.key, required this.text ,this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 16,
          letterSpacing: 0.5),
    );
  }
}

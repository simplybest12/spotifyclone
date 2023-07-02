import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final text;
  final color;
  final textcolor;
   Buttons({super.key,
  required this.color,
  required this.textcolor,
  required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 52,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          child: Text(
            text,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 16,
                letterSpacing: 0.5),
          )),
    );
  }
}

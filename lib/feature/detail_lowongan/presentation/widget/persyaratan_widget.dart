import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPersyaratan extends StatelessWidget {
  const TextPersyaratan({super.key, required this.persyaratan});
  final String persyaratan;

  @override
  Widget build(BuildContext context) {
    return Text(
      persyaratan,
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

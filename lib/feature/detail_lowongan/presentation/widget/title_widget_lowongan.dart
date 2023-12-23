import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TittleLowonganWidget extends StatelessWidget {
  const TittleLowonganWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

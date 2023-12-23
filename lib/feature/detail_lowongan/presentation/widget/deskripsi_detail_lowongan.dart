import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeskripsiWidget extends StatelessWidget {
  const DeskripsiWidget({super.key, required this.deskripsi});
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deskripsi",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          deskripsi,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.justify,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}

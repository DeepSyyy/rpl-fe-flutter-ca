import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingComponent extends StatelessWidget {
  const RatingComponent({super.key, required this.dataRating});
  final String dataRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 16,
          ),
          Text(
            dataRating,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

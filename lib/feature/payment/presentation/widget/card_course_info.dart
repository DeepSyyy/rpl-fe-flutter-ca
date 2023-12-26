import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCourseInfo extends StatelessWidget {
  const CardCourseInfo(
      {super.key,
      required this.judulCourse,
      required this.namaAuthor,
      required this.imageUrl});
  final String judulCourse;
  final String namaAuthor;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFE5E5E5)),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 118,
              height: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple,
              ),
              child: Image.asset(imageUrl),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judulCourse,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  namaAuthor,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7B8CB5),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

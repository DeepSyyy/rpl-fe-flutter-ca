import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({Key? key, this.text, this.image, this.title})
      : super(key: key);

  final String? text, image, title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              image!,
              height: 350,
              width: 343,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              title!, // Menggunakan Text untuk menampilkan judul
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF7A7A7A),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

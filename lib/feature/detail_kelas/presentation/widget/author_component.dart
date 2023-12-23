import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorComponent extends StatelessWidget {
  const AuthorComponent({super.key, required this.author});
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(author,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey,
          )),
    );
  }
}

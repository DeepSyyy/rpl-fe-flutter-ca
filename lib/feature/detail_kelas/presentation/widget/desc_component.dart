import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescCourseComponent extends StatelessWidget {
  const DescCourseComponent({super.key, required this.desc});
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(desc,
        overflow: TextOverflow.clip,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.black,
        ));
  }
}

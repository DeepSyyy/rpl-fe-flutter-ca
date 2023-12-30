import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class DescCourseComponent extends StatelessWidget {
  const DescCourseComponent({super.key, required this.desc});
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(desc,
        overflow: TextOverflow.clip,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColor.textPrimary,
        ));
  }
}

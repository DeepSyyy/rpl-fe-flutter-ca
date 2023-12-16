import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PointOfCourseComponent extends StatelessWidget {
  const PointOfCourseComponent(
      {super.key, required this.svgAsset, required this.desc});
  final String svgAsset;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgAsset,
          color: Color(0xFF7B8CB5),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          desc,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.textSecondary),
        )
      ],
    );
  }
}

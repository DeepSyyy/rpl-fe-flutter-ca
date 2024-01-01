import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCourseContainer extends StatelessWidget {
  final String svgAsset;
  final String title;
  const FeatureCourseContainer(
      {super.key, required this.svgAsset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 94,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.white,
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child: Column(
        children: [
          SvgPicture.asset(
            svgAsset,
            height: 24,
            width: 24,
            color: const Color(0xFFF4F46E5),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                color: const Color(0xFF111111),
                fontSize: 12,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TipeLowongan extends StatelessWidget {
  const TipeLowongan({super.key, required this.tipe});
  final String tipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/svg/access_time.svg",
          height: 20,
          width: 20,
        ),
        const SizedBox(width: 8),
        Text(
          tipe,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColor.textSecondary,
          ),
        )
      ],
    );
  }
}

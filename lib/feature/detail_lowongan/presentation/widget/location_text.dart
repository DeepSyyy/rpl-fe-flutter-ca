import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationText extends StatelessWidget {
  const LocationText({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/svg/Location.svg",
          color: AppColor.textSecondary,
          height: 20,
          width: 20,
        ),
        const SizedBox(width: 8),
        Text(location,
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.textSecondary)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class PerusahaanText extends StatelessWidget {
  const PerusahaanText({super.key, required this.perusahaan});
  final String perusahaan;

  @override
  Widget build(BuildContext context) {
    return Text(
      perusahaan,
      style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.textSecondary),
    );
  }
}

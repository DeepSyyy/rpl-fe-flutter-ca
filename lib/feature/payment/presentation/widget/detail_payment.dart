import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPayment extends StatelessWidget {
  const DetailPayment(
      {super.key,
      required this.title,
      required this.data,
      required this.colorData});
  final String title;
  final String data;
  final Color colorData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColor.textPrimary),
        ),
        Text(
          data,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600, color: colorData),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailListPayment extends StatelessWidget {
  const DetailListPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF7A7A7A).withOpacity(0.2),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Kelas",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            detailPayment(
                context, "Harga Kelas", "Rp 400.000", AppColor.textPrimary),
            const SizedBox(
              height: 10,
            ),
            detailPayment(
              context,
              "Kode Unik",
              "Rp 400.000",
              Color(0xFF36D183),
            ),
            const SizedBox(height: 16),
            detailPayment(
              context,
              "Service fee",
              "Rp 400.000",
              Color(0xFF36D183),
            ),
            const SizedBox(height: 16),
            detailPayment(
                context, "Total Transfer", "Rp 400.000", AppColor.primary),
          ],
        ),
      ),
    );
  }
}

Row detailPayment(
    BuildContext context, String title, String data, Color colorData) {
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

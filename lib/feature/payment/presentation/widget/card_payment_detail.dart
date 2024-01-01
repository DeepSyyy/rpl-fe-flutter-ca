import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/detail_payment.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPaymentDetail extends StatelessWidget {
  const CardPaymentDetail({super.key, required this.price});
  final String price;

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
            DetailPayment(
              title: "Harga Kelas",
              data: "Rp. $price",
              colorData: AppColor.primary,
            ),
            const SizedBox(
              height: 10,
            ),
            const DetailPayment(
              title: "Kode Unik",
              data: "Rp. 0",
              colorData: AppColor.primary,
            ),
            const SizedBox(height: 16),
            const DetailPayment(
              title: "Service Fee",
              data: "Rp. 0",
              colorData: AppColor.primary,
            ),
            const SizedBox(height: 16),
            DetailPayment(
              title: "Total Pembayaran",
              data: "Rp. $price",
              colorData: AppColor.primary,
            ),
          ],
        ),
      ),
    );
  }
}

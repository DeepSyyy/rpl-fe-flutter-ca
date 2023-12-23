import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingFeature extends StatelessWidget {
  const ListingFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFF7A7A7A).withOpacity(0.2),
          ),
        ),
        child: Column(
          children: [
            listingProfile(context, "Karir Tujuan", () {}),
            const Divider(
              color: Color(0xFFD9D9D9),
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            listingProfile(context, "Transaksi", () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => TransaksiPage(),
              //   ),
              // );
            }),
            const Divider(
              color: Color(0xFFD9D9D9),
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            listingProfile(context, "Pengaturan", () {}),
            const Divider(
              color: Color(0xFFD9D9D9),
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            listingProfile(context, "Tentang Courze", () {}),
            const Divider(
              color: Color(0xFFD9D9D9),
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            listingProfile(context, "Bantuan dan Pendukung", () {}),
          ],
        ),
      ),
    );
  }
}

Padding listingProfile(
    BuildContext context, String feature, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                feature,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textPrimary,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Color(0xFF7A7A7A),
          ),
        ],
      ),
    ),
  );
}

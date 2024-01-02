import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/page/home_page_view.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSuccessComponent extends StatelessWidget {
  const PaymentSuccessComponent(
      {super.key, required this.idUser, required this.imageUrl});
  final String idUser;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF6F6F6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 6,
                color: const Color(0xFFFAFAFA),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                width: 190,
                height: 190,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 90,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Pembelian Sukses",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColor.textPrimary,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Nikmati perjalanan setiap langkah \npembelajaran kamu di Courze.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.textPrimary),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: ButtonCustom(
              label: "Kembali ke beranda",
              //Sementara aja
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => HomePageView(),
                    ),
                    (route) => false);
              },
              isExpand: true,
            ),
          )
        ],
      ),
    );
  }
}

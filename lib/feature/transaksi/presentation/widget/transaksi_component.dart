import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/widget/card_course_transaksi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';

class TransaksiComponent extends StatefulWidget {
  const TransaksiComponent({super.key});

  @override
  State<TransaksiComponent> createState() => _TransaksiComponentState();
}

class _TransaksiComponentState extends State<TransaksiComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: Border(
            bottom: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Riwayat Transaksi',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              "Transaksi Kamu",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Daftar pembelian kelas Premium Anda, membuka jalan menuju karir yang cemerlang di masa depan.",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.textSecondary,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CourseCardTransaksi()
          ],
        ),
      ),
    );
  }
}

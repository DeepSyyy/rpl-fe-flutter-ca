import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

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
    );
  }
}

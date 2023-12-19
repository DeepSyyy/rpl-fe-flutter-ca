import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/widget/detail_list_payment.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/widget/header_course.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/widget/payment_method.dart';
import 'package:google_fonts/google_fonts.dart';

class TransaksiComponent extends StatelessWidget {
  const TransaksiComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Transaksi',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FluentSystemIcons.ic_fluent_arrow_left_regular,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: const [
          HeaderCourse(),
          SizedBox(
            height: 24,
          ),
          DetailListPayment(),
          SizedBox(
            height: 24,
          ),
          PaymentMethod()
        ],
      ),
    );
  }
}

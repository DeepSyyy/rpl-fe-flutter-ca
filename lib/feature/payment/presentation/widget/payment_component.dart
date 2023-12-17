import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_course_info.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_payment_detail.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/payment_choice_card.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Payment",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const CardCourseInfo(
                  judulCourse: "nama course",
                  namaAuthor: "nama author",
                ),
                const SizedBox(
                  height: 20,
                ),
                CardPaymentDetail(),
                const SizedBox(
                  height: 20,
                ),
                PaymentChoiceCard(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ButtonCustom(isExpand: true, label: "Bayar", onTap: () {}),
          )
        ],
      ),
    );
  }
}

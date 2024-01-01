import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/provider/my_course_provider.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_course_info.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_payment_detail.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/payment_choice_card.dart';
import 'package:flutter_fe_rpl/feature/payment_success/presentation/page/payment_succes_page.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/provider/transaksi_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent(
      {super.key,
      required this.imageUrl,
      required this.courseName,
      required this.mentorName,
      required this.idCourse,
      required this.price,
      this.idUser});
  final String imageUrl;
  final String courseName;
  final String mentorName;
  final String? idUser;
  final String idCourse;
  final String price;

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
                CardCourseInfo(
                  judulCourse: courseName,
                  namaAuthor: mentorName,
                  imageUrl: imageUrl,
                ),
                const SizedBox(
                  height: 20,
                ),
                CardPaymentDetail(
                  price: price,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PaymentChoiceCard(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Consumer2<MyCourseProvider, TransactionProvider>(
                builder: (context, myCourse, myTransaction, _) {
              return ButtonCustom(
                  isExpand: true,
                  label: "Bayar",
                  onTap: () async {
                    await myCourse.addMyCourse(
                        idUser: idUser, idCourse: idCourse);
                    await myTransaction.addTransaction(
                        idCourse: idCourse, idUser: idUser!);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentSuccesPage(
                                  idUser: idUser!,
                                  imageUrl: imageUrl,
                                )),
                        (route) => false);
                  });
            }),
          )
        ],
      ),
    );
  }
}

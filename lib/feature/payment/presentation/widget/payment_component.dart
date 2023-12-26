import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/page/home_page_view.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/provider/my_course_provider.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_course_info.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_payment_detail.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/payment_choice_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent(
      {super.key,
      required this.imageUrl,
      required this.courseName,
      required this.mentorName,
      required this.idCourse,
      this.idUser});
  final String imageUrl;
  final String courseName;
  final String mentorName;
  final String? idUser;
  final String idCourse;

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
            child: Consumer<MyCourseProvider>(builder: (context, state, _) {
              return ButtonCustom(
                  isExpand: true,
                  label: "Bayar",
                  onTap: () async {
                    await state.addMyCourse(idUser: idUser, idCourse: idCourse);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageView()),
                        (route) => false);
                  });
            }),
          )
        ],
      ),
    );
  }
}

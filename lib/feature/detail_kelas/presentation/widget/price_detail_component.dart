import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/page/payment_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceComponent extends StatelessWidget {
  const PriceComponent(
      {super.key,
      required this.price,
      required this.imageUrl,
      required this.courseName,
      required this.mentorName,
      required this.idCourse,
      required this.idUser});
  final String price;
  final String imageUrl;
  final String courseName;
  final String mentorName;
  final String idUser;
  final String idCourse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Rp. ${price}",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        Expanded(
          // height: 50,
          child: ButtonCustom(
              label: "Beli",
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          imageUrl: imageUrl,
                          courseName: courseName,
                          mentorName: mentorName,
                          idUser: idUser,
                          idCourse: idCourse,
                        ),
                        settings: RouteSettings(arguments: {
                          "imageUrl": imageUrl,
                          "courseName": courseName,
                          "mentorName": mentorName,
                          "idUser": idUser,
                          "price": price,
                          "idCourse": idCourse,
                        }),
                      ),
                    ),
                  },
              isExpand: false),
        )
      ]),
    );
  }
}

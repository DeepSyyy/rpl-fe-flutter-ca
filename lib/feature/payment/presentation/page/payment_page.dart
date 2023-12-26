import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/payment_component.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage(
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
    return PaymentComponent(
        imageUrl: imageUrl,
        courseName: courseName,
        mentorName: mentorName,
        idCourse: idCourse,
        idUser: idUser);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/payment_success/presentation/widget/payment_succes_component.dart';

class PaymentSuccesPage extends StatelessWidget {
  const PaymentSuccesPage(
      {super.key, required this.idUser, required this.imageUrl});
  final String idUser;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return PaymentSuccessComponent(
      idUser: idUser,
      imageUrl: imageUrl,
    );
  }
}

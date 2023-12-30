import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/widget/transaksi_component.dart';

class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key, required this.idUser});
  final String idUser;

  @override
  Widget build(BuildContext context) {
    return TransaksiComponent(idUser: idUser);
  }
}

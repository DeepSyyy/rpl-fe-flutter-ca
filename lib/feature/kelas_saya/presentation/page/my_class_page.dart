import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/widget/my_class_component.dart';

class MyClassPage extends StatelessWidget {
  const MyClassPage({super.key, required this.idUser});
  final String? idUser;

  @override
  Widget build(BuildContext context) {
    return MyClassComponent(idUser: idUser);
  }
}

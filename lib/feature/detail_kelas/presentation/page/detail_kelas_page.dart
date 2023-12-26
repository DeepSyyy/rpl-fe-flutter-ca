import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/detail_kelas.dart';

class DetailKelasPage extends StatelessWidget {
  const DetailKelasPage({super.key, required this.id, required this.idUser});
  final String id;
  final String idUser;

  @override
  Widget build(BuildContext context) {
    return DetailKelasComponent(id: id, idUser: idUser);
  }
}

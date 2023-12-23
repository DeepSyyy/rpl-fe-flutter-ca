import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/detail_kelas.dart';

class DetailKelasPage extends StatelessWidget {
  const DetailKelasPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return DetailKelasComponent(id: id);
  }
}

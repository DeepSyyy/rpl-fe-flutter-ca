import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/detail_lowongan_widget.dart';

class DetailLowonganPage extends StatelessWidget {
  const DetailLowonganPage(
      {super.key, required this.id, required this.category});
  final String id;
  final String category;

  @override
  Widget build(BuildContext context) {
    return DetaiLowonganWidget(id: id, category: category);
  }
}

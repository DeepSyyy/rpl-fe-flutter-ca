import 'package:flutter_fe_rpl/feature/lowongan/business/entity/sub_entity.dart';

class LowonganEntity {
  String? id;
  final String title;
  final String kategori;
  final String perusahaan;
  final String lokasi;
  final String tipe;
  final String description;
  final List<String> persyaratan;
  final List<KontakEntity>? kontak;

  LowonganEntity({
    this.id,
    required this.title,
    required this.kategori,
    required this.perusahaan,
    required this.lokasi,
    required this.tipe,
    required this.description,
    required this.persyaratan,
    this.kontak,
  });
}

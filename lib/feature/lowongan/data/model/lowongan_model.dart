import 'package:flutter_fe_rpl/feature/lowongan/business/entity/lowongan_entity.dart';
import 'package:flutter_fe_rpl/feature/lowongan/data/model/sub_model.dart';

class LowonganModel extends LowonganEntity {
  @override
  String? id;
  @override
  final String title;
  @override
  final String kategori;
  @override
  final String perusahaan;
  @override
  final String lokasi;
  @override
  final String tipe;
  @override
  final String description;
  @override
  final List<String> persyaratan;
  @override
  final List<KontakModel>? kontak;

  LowonganModel({
    this.id,
    required this.title,
    required this.kategori,
    required this.perusahaan,
    required this.lokasi,
    required this.tipe,
    required this.description,
    required this.persyaratan,
    this.kontak,
  }) : super(
          id: id,
          title: title,
          kategori: kategori,
          perusahaan: perusahaan,
          lokasi: lokasi,
          tipe: tipe,
          description: description,
          persyaratan: persyaratan,
          kontak: kontak,
        );

  factory LowonganModel.fromJson(Map<String, dynamic> json) {
    return LowonganModel(
      id: json['id'],
      title: json['title'],
      kategori: json['kategori'],
      perusahaan: json['perusahaan'],
      lokasi: json['lokasi'],
      tipe: json['tipe'],
      description: json['description'],
      persyaratan: json['persyaratan'] != null
          ? List<String>.from(json['persyaratan'])
          : [],
      kontak: json['kontak'] != null
          ? List<KontakModel>.from(
              json['kontak'].map((x) => KontakModel.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'kategori': kategori,
      'perusahaan': perusahaan,
      'lokasi': lokasi,
      'tipe': tipe,
      'description': description,
      'persyaratan': persyaratan,
      'kontak': kontak?.map((e) => e.toJson()).toList(),
    };
  }
}

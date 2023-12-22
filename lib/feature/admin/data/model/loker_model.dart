import 'package:flutter_fe_rpl/feature/admin/business/entity/loker_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/data/model/kontak_model.dart';

class LokerModel extends LokerEntity {
  String? id;
  final String title;
  final String kategori;
  final String perusahaan;
  final String lokasi;
  final String tipe;
  final String description;
  final List<String> persyaratan;
  final List<KontakModel>? kontak;

  LokerModel({
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

  factory LokerModel.fromJson(Map<String, dynamic> json) {
    return LokerModel(
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

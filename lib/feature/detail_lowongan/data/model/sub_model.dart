import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/sub_entity.dart';

class KontakModelDetailLowongan extends KontakEntityDetailLowongan {
  final String alamat;
  final String nomor;
  final String email;

  KontakModelDetailLowongan({
    required this.alamat,
    required this.nomor,
    required this.email,
  }) : super(
          alamat: alamat,
          nomor: nomor,
          email: email,
        );

  factory KontakModelDetailLowongan.fromJson(Map<String, dynamic> json) =>
      KontakModelDetailLowongan(
        alamat: json['alamat'],
        nomor: json['nomor'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'alamat': alamat,
        'nomor': nomor,
        'email': email,
      };
}

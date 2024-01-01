import 'package:flutter_fe_rpl/feature/lowongan/business/entity/sub_entity.dart';

class KontakModel extends KontakEntity {
  @override
  final String alamat;
  @override
  final String nomor;
  @override
  final String email;

  KontakModel({
    required this.alamat,
    required this.nomor,
    required this.email,
  }) : super(
          alamat: alamat,
          nomor: nomor,
          email: email,
        );

  factory KontakModel.fromJson(Map<String, dynamic> json) {
    return KontakModel(
      alamat: json['alamat'],
      nomor: json['nomor'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alamat': alamat,
      'nomor': nomor,
      'email': email,
    };
  }
}

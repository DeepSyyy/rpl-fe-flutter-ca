import 'dart:convert';

import 'package:flutter_fe_rpl/feature/sign_in/business/entities/main_entities/user_response_entity.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/model/sub_model/user_model.dart';

class UserResponseModel extends UserResponseEntity {
  final int code;
  final String status;
  final UserModel data;

  UserResponseModel({
    required this.code,
    required this.status,
    required this.data,
  }) : super(
          code: code,
          status: status,
          data: data,
        );

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) =>
      UserResponseModel(
        code: json["code"],
        status: json["status"],
        data: UserModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": data.toMap(),
      };
}

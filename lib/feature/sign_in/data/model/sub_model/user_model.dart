import 'dart:convert';

import 'package:flutter_fe_rpl/feature/sign_in/business/entities/sub_entities/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String userId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final bool isVerified;
  @override
  final DateTime createAt;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.isVerified,
    required this.createAt,
  }) : super(
          userId: userId,
          name: name,
          email: email,
          password: password,
          isVerified: isVerified,
          createAt: createAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isVerified: json["is_verified"],
        createAt: DateTime.parse(json["create_at"]),
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "password": password,
        "is_verified": isVerified,
        "create_at": createAt.toIso8601String(),
      };
}

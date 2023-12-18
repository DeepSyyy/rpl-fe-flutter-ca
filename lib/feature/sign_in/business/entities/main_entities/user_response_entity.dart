import 'package:flutter_fe_rpl/feature/sign_in/business/entities/sub_entities/user_entity.dart';

class UserResponseEntity {
  final int code;
  final String status;
  final UserEntity data;

  UserResponseEntity({
    required this.code,
    required this.status,
    required this.data,
  });
}

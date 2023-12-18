import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/entities/main_entities/user_response_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserResponseEntity>> signIn(
      {required UserParamsLogin userParamsLogin});
}

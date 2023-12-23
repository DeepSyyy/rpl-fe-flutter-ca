import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> signIn(
      {required UserParamsLogin userParamsLogin});
}

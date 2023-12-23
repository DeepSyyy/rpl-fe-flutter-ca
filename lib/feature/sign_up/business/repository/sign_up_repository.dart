import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';

abstract class SignUpUserRepository {
  Future<Either<Failure, void>> signUp(
      {required UserParamsRegister userParamsRegister});
}

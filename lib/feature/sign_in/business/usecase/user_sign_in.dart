import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/repository/user_repository.dart';

class SignIn {
  final UserRepository userRepository;

  SignIn(this.userRepository);

  Future<Either<Failure, void>> call({
    required UserParamsLogin userParamsLogin,
  }) async {
    return await userRepository.signIn(userParamsLogin: userParamsLogin);
  }
}

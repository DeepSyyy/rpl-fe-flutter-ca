import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_up/business/repository/sign_up_repository.dart';

class SignUp {
  final SignUpUserRepository userRepository;

  SignUp(this.userRepository);

  Future<Either<Failure, void>> call({
    required UserParamsRegister userParamsRegister,
  }) async {
    return await userRepository.signUp(userParamsRegister: userParamsRegister);
  }
}

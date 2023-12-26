import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/repository/user_repository.dart';

class ResetPassword {
  final UserRepository userRepository;

  ResetPassword(this.userRepository);

  Future<Either<Failure, void>> call({
    required String email,
  }) async {
    return await userRepository.resetPassword(
      email: email,
    );
  }
}

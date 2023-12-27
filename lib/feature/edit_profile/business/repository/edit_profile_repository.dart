import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';

abstract class EditProfileUserRepository {
  Future<Either<Failure, void>> editProfile({required String name});
}

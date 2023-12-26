import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/business/repository/edit_profile_repository.dart';

class EditProfileUser {
  EditProfileUserRepository repository;

  EditProfileUser(this.repository);

  Future<Either<Failure, void>> call(
      {required String name, required String password}) async {
    return await repository.editProfile(
      name: name,
    );
  }
}

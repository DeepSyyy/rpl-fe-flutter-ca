import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/business/repository/edit_profile_repository.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/data/datasource/edit_user_profile_remote_data_source.dart';

class EditProfileUserRepositoryImpl implements EditProfileUserRepository {
  final EditProfileUserRemoteDataSource editProfileUserDataSource;

  EditProfileUserRepositoryImpl({required this.editProfileUserDataSource});

  @override
  Future<Either<Failure, void>> editProfile({
    required String name,
  }) async {
    try {
      await editProfileUserDataSource.editProfile(name: name);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'server failure'));
    }
  }
}

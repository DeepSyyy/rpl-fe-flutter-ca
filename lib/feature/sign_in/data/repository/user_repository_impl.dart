import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/repository/user_repository.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/datasource/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, void>> signIn(
      {required UserParamsLogin userParamsLogin}) async {
    try {
      return await userRemoteDataSource.signIn(
          userParamsLogin: userParamsLogin);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      return await userRemoteDataSource.resetPassword(email: email);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }
}

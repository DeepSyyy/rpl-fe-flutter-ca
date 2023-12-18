import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/repository/user_repository.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/datasource/user_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/model/main_model/user_response_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, UserResponseModel>> signIn(
      {required UserParamsLogin userParamsLogin}) async {
    try {
      final result =
          await userRemoteDataSource.signIn(userParamsLogin: userParamsLogin);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Server Failure, $e'));
    }
  }
}

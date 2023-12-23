import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_up/business/repository/sign_up_repository.dart';
import 'package:flutter_fe_rpl/feature/sign_up/data/datasource/sign_up_remote_datasource.dart';

class SignUpRepositoryImpl implements SignUpUserRepository {
  final SignUpRemoteDataSource signUpRemoteDataSource;

  SignUpRepositoryImpl({required this.signUpRemoteDataSource});

  @override
  Future<Either<Failure, void>> signUp(
      {required UserParamsRegister userParamsRegister}) async {
    try {
      return await signUpRemoteDataSource.signUp(
          userParamsRegister: userParamsRegister);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }
}

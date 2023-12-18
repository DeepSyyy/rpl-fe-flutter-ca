import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/entities/main_entities/user_response_entity.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/usecase/user_sign_in.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/datasource/user_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/repository/user_repository_impl.dart';

class UserResponseProvider extends ChangeNotifier {
  UserResponseEntity? userResponse;
  Failure? failure;

  UserResponseProvider({this.userResponse, this.failure});

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserRepositoryImpl repo = UserRepositoryImpl(
        userRemoteDataSource: UserRemoteDataSourceImpl(
          dio: Dio(),
        ),
      );

      final failureOrUserResponse = await SignIn(repo).call(
        userParamsLogin: UserParamsLogin(
          email: email,
          password: password,
        ),
      );

      failureOrUserResponse.fold((newFailure) {
        failure = newFailure;
        notifyListeners();
      }, (newUserResponse) {
        userResponse = newUserResponse;
        notifyListeners();
      });
    } catch (e) {
      failure = ServerFailure(errorMessage: 'Server Failure');
      notifyListeners();
    }
  }
}

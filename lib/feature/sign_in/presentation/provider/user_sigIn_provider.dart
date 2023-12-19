import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/usecase/user_sign_in.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/repository/user_repository_impl.dart';

class UserResponseProvider extends ChangeNotifier {
  UserRepositoryImpl userRepositoryImpl;
  String? message;

  UserResponseProvider({
    required this.userRepositoryImpl,
  });

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserParamsLogin userParamsLogin = UserParamsLogin(
        email: email,
        password: password,
      );
      final failureOrVoid =
          await SignIn(userRepositoryImpl)(userParamsLogin: userParamsLogin);

      failureOrVoid.fold(
        (failure) {
          message = failure.errorMessage;
          notifyListeners();
        },
        (voidValue) {
          message = null;
          notifyListeners();
        },
      );
    } catch (e) {
      message = e.toString();
      notifyListeners();
    }
  }
}

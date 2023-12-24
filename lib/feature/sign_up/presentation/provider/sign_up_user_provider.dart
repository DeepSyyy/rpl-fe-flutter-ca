import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_up/business/usecase/sign_up.dart';
import 'package:flutter_fe_rpl/feature/sign_up/data/repository/sign_up_repository_impl.dart';

class SignUpUserProvider extends ChangeNotifier {
  SignUpRepositoryImpl signUpRepositoryImpl;
  String? message;

  SignUpUserProvider({
    required this.signUpRepositoryImpl,
  });

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      UserParamsRegister userParamsRegister = UserParamsRegister(
        email: email,
        password: password,
        name: name,
        role: role,
      );
      final failureOrVoid = await SignUp(signUpRepositoryImpl)(
          userParamsRegister: userParamsRegister);

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

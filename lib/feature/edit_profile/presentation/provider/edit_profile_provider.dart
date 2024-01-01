import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/business/usecase/edit_profile.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/data/repository/edit_profile_user_repository_impl.dart';

class EditProfileProvider extends ChangeNotifier {
  EditProfileUserRepositoryImpl editProfileUserRepositoryImpl;
  String? message;

  EditProfileProvider({
    required this.editProfileUserRepositoryImpl,
  });

  Future<void> editProfile({
    required String password,
    required String name,
  }) async {
    try {
      final failureOrVoid =
          await EditProfileUser(editProfileUserRepositoryImpl)(
              password: password, name: name);

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

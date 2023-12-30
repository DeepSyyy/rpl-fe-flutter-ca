import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/profile/feature/user_profile/presentation/widget/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.idUser});
  final String? idUser;

  @override
  Widget build(BuildContext context) {
    return ProfileComponent(
      userId: idUser,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_logout.dart';
import 'package:flutter_fe_rpl/feature/profile/feature/user_profile/presentation/widget/feature_list_profile.dart';
import 'package:flutter_fe_rpl/feature/profile/feature/user_profile/presentation/widget/header_user_profile.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/sign_in_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    String? uid = Provider.of<AuthUserProvider>(context).uid;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFFF6F6F6),
        title: Text(
          "Profil",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColor.textPrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          HeaderProfile(),
          const SizedBox(
            height: 24,
          ),
          ListingFeature(
            idUser: userId,
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Consumer<AuthUserProvider>(builder: (context, value, _) {
              return ButtonLogout(
                  label: "Logout",
                  onTap: () async {
                    await Provider.of<AuthUserProvider>(context, listen: false)
                        .logout();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  },
                  isExpand: true);
            }),
          )
        ],
      ),
    );
  }
}

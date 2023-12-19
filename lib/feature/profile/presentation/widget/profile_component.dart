import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_logout.dart';
import 'package:flutter_fe_rpl/feature/profile/presentation/widget/header_profile.dart';
import 'package:flutter_fe_rpl/feature/profile/presentation/widget/listing_feature.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
          headerProfile(context),
          const SizedBox(
            height: 24,
          ),
          ListingFeature(),
          const SizedBox(
            height: 32,
          ),
          ButtonLogout(label: "Logout", onTap: () {}, isExpand: true)
        ],
      ),
    );
  }
}

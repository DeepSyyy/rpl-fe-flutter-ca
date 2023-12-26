import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/presentation/widget/input_email.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/presentation/widget/input_nama.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/presentation/widget/input_pasword.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileComponent extends StatefulWidget {
  const EditProfileComponent({super.key});

  @override
  State<EditProfileComponent> createState() => _EditProfileComponentState();
}

class _EditProfileComponentState extends State<EditProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Personal Profil',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FluentSystemIcons.ic_fluent_arrow_left_regular,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                "Nama",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textPrimary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InputNama(),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Email",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textPrimary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InputEmail(),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Password",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textPrimary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InputPassword(),
              const SizedBox(
                height: 20,
              ),
              ButtonCustom(label: "Simpan", onTap: () {}, isExpand: true)
            ],
          ),
        ),
      ),
    );
  }
}

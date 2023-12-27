import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/presentation/provider/edit_profile_provider.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/presentation/widget/input_nama.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileComponent extends StatefulWidget {
  const EditProfileComponent({super.key});

  @override
  State<EditProfileComponent> createState() => _EditProfileComponentState();
}

class _EditProfileComponentState extends State<EditProfileComponent> {
  void initState() {
    super.initState();
    Provider.of<AuthUserProvider>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    String? nama = Provider.of<AuthUserProvider>(context).name;
    TextEditingController controllerNama = TextEditingController(text: nama);
    TextEditingController controllerPassword = TextEditingController();
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
              InputNama(
                controllerNama: controllerNama,
              ),
              const SizedBox(
                height: 12,
              ),
              // Text(
              //   "Email",
              //   style: GoogleFonts.poppins(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w600,
              //     color: AppColor.textPrimary,
              //   ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // InputEmail(
              //   controllerEmail: controllerEmail,
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Text(
              //   "Password",
              //   style: GoogleFonts.poppins(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w600,
              //     color: AppColor.textPrimary,
              //   ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // InputPassword(
              //   controllerPassword: controllerPassword,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Consumer<EditProfileProvider>(builder: (context, state, _) {
                return ButtonCustom(
                    label: "Simpan",
                    onTap: () async {
                      await state.editProfile(
                          name: controllerNama.text,
                          password: controllerPassword.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil mengubah data"),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    isExpand: true);
              })
            ],
          ),
        ),
      ),
    );
  }
}

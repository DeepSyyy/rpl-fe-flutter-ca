import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/provider/user_sigIn_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/sign_in_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPasswordComponent extends StatefulWidget {
  ResetPasswordComponent({super.key});

  @override
  State<ResetPasswordComponent> createState() => _ResetPasswordComponentState();
}

class _ResetPasswordComponentState extends State<ResetPasswordComponent> {
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "Ubah Password",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Masukkan email kamu untuk reset sandi",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: const Color(0xFFF1F1F1),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintText: "Email Pengguna",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7A7A7A),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.primary),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            Consumer<UserResponseProvider>(builder: (context, state, _) {
              return ButtonCustom(
                  label: "Kirim Email",
                  onTap: () async {
                    await state.resetPassword(email: controllerEmail.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Email berhasil dikirim"),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    if (state.message == null) {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return SignInView();
                      }), (route) => false);
                    }
                  },
                  isExpand: true);
            })
          ],
        ),
      ),
    );
  }
}

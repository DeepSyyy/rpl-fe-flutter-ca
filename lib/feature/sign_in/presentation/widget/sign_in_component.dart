import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/page/home_page_view.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/input_email.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/input_password.dart';
import 'package:flutter_fe_rpl/feature/sign_up/presentation/page/sign_up_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPasswordHidden = true;
    final controllerEmail = TextEditingController();

    final controllerPassword = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 106,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Courze.",
                    style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputEmailField(
                  controllerEmail: controllerEmail,
                ),
                const SizedBox(
                  height: 16,
                ),
                InputPasswordField(
                  isPasswordHidden: isPasswordHidden,
                  controllerPassword: controllerPassword,
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Password?",
                    style: GoogleFonts.poppins(
                        //decoration: TextDecoration.underline,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primary),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ButtonCustom(
                  label: "Login sekarang",
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePageView())),
                  isExpand: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Belum Punya Akun? ',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAFAFAF),
                    ),
                    children: [
                      TextSpan(
                        text: 'Daftar',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          //decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Atau",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF444444),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

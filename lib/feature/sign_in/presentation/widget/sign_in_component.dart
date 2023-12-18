import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/page/home_page_view.dart';
import 'package:flutter_fe_rpl/feature/sign_in/business/entities/main_entities/user_response_entity.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/datasource/user_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/repository/user_repository_impl.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/provider/user_sigIn_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/input_email.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/input_password.dart';
import 'package:flutter_fe_rpl/feature/sign_up/presentation/page/sign_up_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final controllerEmail = TextEditingController();
  bool isPasswordHidden = true;
  final controllerPassword = TextEditingController();
  Future<int> _signIn(BuildContext context) async {
    final email = controllerEmail.text;
    final pass = controllerPassword.text;
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email tidak boleh kosong'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final res = await UserRepositoryImpl(
        userRemoteDataSource: UserRemoteDataSourceImpl(
          dio: Dio(),
        ),
      ).signIn(
        userParamsLogin: UserParamsLogin(
          email: email,
          password: pass,
        ),
      );

      res.fold((failure) {
        if (failure is ClientFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email atau Password salah'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }, (userResponse) {
        if (userResponse.status == 200) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePageView()));
          return 200;
        } else if (userResponse.status == 404) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email atau Password salah'),
              backgroundColor: Colors.red,
            ),
          );
          return 404;
        }
      });
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    UserResponseEntity? userResponse = Provider.of<UserResponseProvider>(
      context,
      listen: false,
    ).userResponse;
    Failure? failure = Provider.of<UserResponseProvider>(
      context,
      listen: false,
    ).failure;
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
                  onTap: () async {
                    await _signIn(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePageView()));
                  },
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

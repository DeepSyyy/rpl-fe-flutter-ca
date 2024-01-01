import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/page/home_page_view.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/sign_in_component.dart';
import 'package:flutter_fe_rpl/feature/sign_up/presentation/provider/sign_up_user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

List<String> role = [
  "UI/UX Designer",
  "Frontend Developer",
  "Backend Developer",
  "Mobile Developer",
  "Data Scientist",
  "Data Analyst",
  "Product Manager",
  "Project Manager",
  "Business Analyst",
  "Digital Marketing",
  "Content Creator",
];

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();
  final controllerName = TextEditingController();
  String selectedRole = role[0];
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                TextFormField(
                  controller: controllerName,
                  validator: (value) =>
                      value == "" ? "Masukan, jangan kosong!" : null,
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: const Color(0xFFF1F1F1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      hintText: "Masukkan Nama Lengkap",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7A7A7A),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColor.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controllerEmail,
                  validator: (value) =>
                      value == "" ? "Masukan, jangan kosong!" : null,
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: const Color(0xFFF1F1F1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      hintText: "Username atau email",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7A7A7A),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColor.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controllerPassword,
                  obscureText: isPasswordHidden,
                  validator: (value) =>
                      value == "" ? "Masukan, jangan kosong!" : null,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: const Color(0xFFF1F1F1),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    hintText: "Password",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF7A7A7A),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          isPasswordHidden
                              ? FluentSystemIcons.ic_fluent_eye_hide_regular
                              : FluentSystemIcons.ic_fluent_eye_show_regular,
                          color: const Color(0xFFAEAECF),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controllerConfirmPassword,
                  obscureText: isPasswordHidden,
                  validator: (value) =>
                      value == "" ? "Masukan, jangan kosong!" : null,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: const Color(0xFFF1F1F1),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    hintText: "Konfirmasi Password",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF7A7A7A),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          isPasswordHidden
                              ? FluentSystemIcons.ic_fluent_eye_hide_regular
                              : FluentSystemIcons.ic_fluent_eye_show_regular,
                          color: const Color(0xFFAEAECF),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: const Color(0xFFF1F1F1),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    hintText: "Pilih Tujuan Karir",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF7A7A7A),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  items: role.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Consumer<SignUpUserProvider>(builder: (context, state, _) {
                  return ButtonCustom(
                    label: "Daftar sekarang",
                    onTap: () async {
                      await state.signUp(
                        email: controllerEmail.text.toLowerCase(),
                        password: controllerPassword.text,
                        name: controllerName.text,
                        role: selectedRole,
                      );
                      if (state.message != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message!),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Sign Up Berhasil"),
                          ),
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePageView(),
                            settings: RouteSettings(
                              arguments: controllerName.text,
                            ),
                          ),
                        );
                      }
                    },
                    isExpand: true,
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Sudah Punya Akun? ',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFAFAFAF),
                    ),
                    children: [
                      TextSpan(
                        text: 'Masuk',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          //decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignInView(),
                              ),
                            );
                          },
                      ),
                    ],
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

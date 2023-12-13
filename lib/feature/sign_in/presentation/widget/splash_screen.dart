import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/onboarding_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const OnboardingView(),
          ),
          (route) => false);
    });
    return Scaffold(
        body: Center(
      child: Text(
        "Courze.",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            color: AppColor.primary, fontSize: 64, fontWeight: FontWeight.bold),
      ),
    ));
  }
}

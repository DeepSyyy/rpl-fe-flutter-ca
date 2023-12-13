import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputPasswordField extends StatefulWidget {
  InputPasswordField(
      {super.key,
      required this.isPasswordHidden,
      required this.controllerPassword});
  bool isPasswordHidden;
  final TextEditingController controllerPassword;

  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllerPassword,
      obscureText: widget.isPasswordHidden,
      validator: (value) => value == "" ? "Masukan, jangan kosong!" : null,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: "Password",
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
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
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              widget.isPasswordHidden = !widget.isPasswordHidden;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              widget.isPasswordHidden
                  ? FluentSystemIcons.ic_fluent_eye_hide_regular
                  : FluentSystemIcons.ic_fluent_eye_show_regular,
              color: Color(0xFFAEAECF),
            ),
          ),
        ),
      ),
    );
  }
}

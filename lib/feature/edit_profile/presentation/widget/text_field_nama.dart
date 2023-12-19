import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class InputNama extends StatefulWidget {
  const InputNama({super.key});

  @override
  State<InputNama> createState() => _InputNamaState();
}

class _InputNamaState extends State<InputNama> {
  final controllerNama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerNama,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: "Nama Pengguna",
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
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
    );
  }
}

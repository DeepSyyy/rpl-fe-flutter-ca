import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 48,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
            border:
                Border.all(color: Color(0xFF7B8CB5).withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
          onTap: () {},
          controller: textController,
          decoration: InputDecoration(
            hintText: "Mau Belajar Apa Hari Ini?",
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7B8CB5)),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Color(0xFF7B8CB5).withOpacity(0.5),
            border: InputBorder.none,
            isCollapsed: true,
            prefixIconConstraints: BoxConstraints(
              minHeight: 12,
              minWidth: 14,
            ),
          ),
        ),
      ),
    );
  }
}

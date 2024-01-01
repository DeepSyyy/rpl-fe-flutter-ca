import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFF1F1F1),
            ),
          ),
          child: TextField(
            onTap: () {},
            decoration: InputDecoration(
              hintText: 'Cari pekerjaan',
              hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF7B8CB5),
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(
                  left: 14,
                  right: 12,
                ),
                child: Icon(
                  Icons.search,
                  color: Color(0xFFBDBDBD),
                ),
              ),
              prefixIconColor: const Color(0xFF7B8CB5).withOpacity(0.5),
              border: InputBorder.none,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 14,
              ),
            ),
          )),
    );
  }
}

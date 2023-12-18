import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key,
      required this.colorCategory,
      required this.categoryData,
      required this.fontColor});
  final Color colorCategory;
  final String categoryData;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorCategory,
        ),
        child: Text(
          categoryData,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: fontColor,
          ),
        ));
  }
}

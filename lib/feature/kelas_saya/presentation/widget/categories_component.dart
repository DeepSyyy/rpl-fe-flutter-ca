import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> categories = [
  'Semua',
  'Gratis',
  'Premium',
];

class CategoriesComponent extends StatefulWidget {
  const CategoriesComponent({super.key});

  @override
  State<CategoriesComponent> createState() => _CategoriesComponentState();
}

class _CategoriesComponentState extends State<CategoriesComponent> {
  String selectedCategory = 'Semua'; // Track the selected category

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String category = categories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 10,
              right: 10,
            ),
            child: Material(
              color: selectedCategory == category
                  ? AppColor.primary
                  : const Color(0xFFE7E7E7),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = category; // Update the selected category
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    category,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: selectedCategory == category
                          ? Colors.white
                          : const Color(0xFFB0B0B0),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> category = [
  'Semua',
  'Rekomendasi',
  'Trending',
];

class CategorySlider extends StatefulWidget {
  const CategorySlider({super.key});

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  String selectedCategory = 'Semua';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          String categoryData = category[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 10,
              right: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: selectedCategory == categoryData
                    ? AppColor.primary
                    : const Color(0xFFE7E7E7),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = categoryData;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      categoryData,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selectedCategory == categoryData
                            ? Colors.white
                            : AppColor.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/category.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/lowongan_container.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/search_component.dart';
import 'package:google_fonts/google_fonts.dart';

class LowonganComponent extends StatelessWidget {
  const LowonganComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Lowongan",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColor.textPrimary,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          const SearchComponent(),
          const SizedBox(
            height: 20,
          ),
          const CategorySlider(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: LowonganContainer(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_asset.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/category_container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LowonganContainer extends StatelessWidget {
  const LowonganContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF7A7A7A).withOpacity(0.2),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SvgPicture.asset(
                      AppAsset.iconCompany,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Company",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7B8CB5),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Posisi Job",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: AppColor.primary,
                      )),
                ],
              ),
              const SizedBox(
                height: 10, // Adjust the height as needed
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppAsset.iconLocation,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Lokasi Company",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7B8CB5),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryContainer(
                      colorCategory: Color(0xFFF69C9C),
                      categoryData: "UI/UX",
                      fontColor: Color(0xFFCD2C2C)),
                  SizedBox(
                    width: 8,
                  ),
                  CategoryContainer(
                      colorCategory: Color(0xFFF6D79C),
                      categoryData: "Mobile Deveolpment",
                      fontColor: Color(0xFFCD702C)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

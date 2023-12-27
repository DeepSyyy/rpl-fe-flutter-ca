import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_asset.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/page/detail_lowongan_page.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/category_container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LowonganContainer extends StatelessWidget {
  const LowonganContainer(
      {super.key,
      required this.title,
      required this.position,
      required this.location,
      required this.category,
      required this.id});
  final String title;
  final String position;
  final String location;
  final String category;
  final String id;

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailLowonganPage(
                  id: id,
                  category: category,
                ),
                settings: RouteSettings(arguments: id),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          title,
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
                          position,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailLowonganPage(
                              id: id,
                              category: category,
                            ),
                            settings: RouteSettings(arguments: id),
                          ),
                        );
                      },
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
                    location,
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
              CategoryContainer(
                categoryData: category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

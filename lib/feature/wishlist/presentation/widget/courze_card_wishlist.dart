import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/provider/wishlist_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CourzeCardWishlist extends StatelessWidget {
  const CourzeCardWishlist({
    super.key,
    required this.imageUrl,
    required this.courseName,
    required this.mentorName,
    required this.rating,
    required this.price,
    required this.id,
    required this.idUser,
  });

  final String imageUrl;
  final String courseName;
  final String mentorName;
  final String rating;
  final String price;
  final String id;
  final String? idUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFF7A7A7A).withOpacity(0.2)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: 124,
                        height: 92,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                          );
                        },
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
                            courseName,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textPrimary,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            mentorName,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.textSecondary,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.textSecondary,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 2,
                                ),
                                child: SvgPicture.asset(
                                  "assets/svg/level_bar.svg",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  price, // Ganti dengan harga sesuai kebutuhan Anda
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textSecondary,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<WishlistProvider>(builder: (context, state, _) {
                      return IconButton(
                        onPressed: () async {
                          try {
                            await state.deleteWishlist(
                                idCourse: id, idUser: idUser!);
                            await state.getWishlist(idUser: idUser!);
                          } catch (e) {
                            print(e);
                          }
                        },
                        icon: Icon(FluentSystemIcons.ic_fluent_delete_regular),
                      );
                    }),
                    const SizedBox(
                      width: 4, // Ubah nilai ini sesuai kebutuhan
                    ),
                    ButtonCustom(label: "Beli", onTap: () {}, isExpand: false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

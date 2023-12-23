import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/page/detail_kelas_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.courseName,
    required this.mentorName,
    required this.price,
    required this.id,
  });
  final String imageUrl;
  final String courseName;
  final String mentorName;
  final String price;
  final String id;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailKelasPage(id: widget.id),
            settings: RouteSettings(arguments: widget.id),
          ),
        );
      },
      child: Column(children: [
        Container(
          height: 147,
          width: 280,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              SizedBox(
                height: 147,
                width: 280,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
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
              IconButton(
                  onPressed: toggleFavorite,
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF7B8CB5).withOpacity(0.5),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          height: 99,
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.courseName,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 0.5),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                        Text("4.5"),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.mentorName,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7B8CB5)),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rp. ${widget.price}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.textSecondary,
                        )),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/level_bar.svg",
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

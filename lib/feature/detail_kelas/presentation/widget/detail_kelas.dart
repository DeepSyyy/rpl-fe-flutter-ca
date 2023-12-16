import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/author_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/course_trailer.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/desc_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/feature_course.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/rating_component.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailKelasComponent extends StatefulWidget {
  const DetailKelasComponent({super.key});

  @override
  State<DetailKelasComponent> createState() => _DetailKelasComponentState();
}

class _DetailKelasComponentState extends State<DetailKelasComponent> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: Border(
            bottom: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Detail Kelas',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          VideoApp(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Course Name',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          const RatingComponent(dataRating: "4.5"),
          const SizedBox(
            height: 8,
          ),
          const AuthorComponent(
            author: "Falah",
          ),
          const SizedBox(
            height: 8,
          ),
          const DescCourseComponent(desc: """Lorem ipsum dolor sit amet, 
          consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
          labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
          exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
          fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
          sunt in culpa qui officia deserunt mollit anim id est laborum."""),
          const SizedBox(
            height: 8,
          ),
          Container(
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FeatureCourseContainer(
                    svgAsset: "assets/svg/level_bar.svg",
                    title: "Semua Level",
                  ),
                  FeatureCourseContainer(
                    svgAsset: "assets/svg/Certificate.svg",
                    title: "Sertifikat",
                  ),
                  FeatureCourseContainer(
                    svgAsset: "assets/svg/consultant.svg",
                    title: "Konsultasi",
                  ),
                  FeatureCourseContainer(
                    svgAsset: "assets/svg/assets.svg",
                    title: "Aset",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Column bodyCourseDetails(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            children: [
              const SizedBox(
                height: 20,
              ),
              VideoApp(),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

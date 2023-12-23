import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/business/entity/course_entity_detail_course.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/provider/detail_course_provider.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/author_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/course_trailer.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/desc_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/feature_course.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/key_points_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/point_course_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/price_detail_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/rating_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailKelasComponent extends StatefulWidget {
  const DetailKelasComponent({super.key, required this.id});
  final String id;

  @override
  State<DetailKelasComponent> createState() => _DetailKelasComponentState();
}

class _DetailKelasComponentState extends State<DetailKelasComponent> {
  bool isFavorite = false;
  void initState() {
    super.initState();
    Provider.of<DetailCourseProvider>(context, listen: false)
        .getCourseDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    CourseEntityDetailCourse? course =
        Provider.of<DetailCourseProvider>(context).course;
    Failure? failure = Provider.of<DetailCourseProvider>(context).failure;
    late Widget widget;
    if (course != null) {
      widget = Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    VideoApp(
                      videoUrl: course.videoUrl,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course.name,
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
                    const SizedBox(
                      height: 8,
                    ),
                    RatingComponent(dataRating: course.rating),
                    const SizedBox(
                      height: 8,
                    ),
                    AuthorComponent(
                      author: course.mentor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DescCourseComponent(desc: course.description),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FeatureCourseContainer(
                              svgAsset: "assets/svg/level_bar.svg",
                              title: course.level,
                            ),
                            const FeatureCourseContainer(
                              svgAsset: "assets/svg/Certificate.svg",
                              title: "Sertifikat",
                            ),
                            const FeatureCourseContainer(
                              svgAsset: "assets/svg/consultant.svg",
                              title: "Konsultasi",
                            ),
                            const FeatureCourseContainer(
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
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Key Points",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: course.keyPoints?.length ?? 0,
                      itemBuilder: (context, index) {
                        return KeyPointsComponent(
                          keyPointsView: course.keyPoints![index],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Detail Kelas",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        PointOfCourseComponent(
                            svgAsset: "assets/svg/created_at.svg",
                            desc: "Dibuat: ${course.createAt}"),
                        const SizedBox(
                          height: 8,
                        ),
                        PointOfCourseComponent(
                            svgAsset: "assets/svg/last_updated.svg",
                            desc: "Diupdate: ${course.updateAt}"),
                        const SizedBox(
                          height: 8,
                        ),
                        const PointOfCourseComponent(
                            svgAsset: "assets/svg/access_time.svg",
                            desc: "Akses Selamanya"),
                        const SizedBox(
                          height: 8,
                        ),
                        const PointOfCourseComponent(
                            svgAsset: "assets/svg/duration_course.svg",
                            desc: "14 Jam total video")
                      ],
                    ),
                  ],
                ),
              ),
              PriceComponent(
                price: course.price,
              ),
            ],
          ),
        ),
      );
    } else if (failure != null) {
      print(failure.errorMessage);
      widget = Scaffold(
        body: Center(
          child: Text(failure.errorMessage),
        ),
      );
    } else {
      widget = const Center(
        child: CircularProgressIndicator(),
      );
    }
    print("failure: $failure, course: $course");
    return widget;
  }
}

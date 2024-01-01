import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/home/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/provider/course_user_provider.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/course_card.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/indicator_carousel.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/my_course_card.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/search_container.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/entity/my_course_entity.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/provider/my_course_provider.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/page/wishlist_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Stream<User?> streamAuthStatus() {
  return FirebaseAuth.instance.authStateChanges();
}

User? get user => FirebaseAuth.instance.currentUser;

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.name});
  final String? name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  bool isFavorite = false;
  String? name = getNameUser();

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<CourseUserProvider>(context, listen: false).getCourses();
    Provider.of<AuthUserProvider>(context, listen: false).getUser();
  }

  final TextEditingController _textController = TextEditingController();
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    List<MyCourseEntity>? myCourse =
        Provider.of<MyCourseProvider>(context).myCourse;
    List<CourseEntity>? courses =
        Provider.of<CourseUserProvider>(context).courses;
    String? role = Provider.of<AuthUserProvider>(context).role;
    String? name = Provider.of<AuthUserProvider>(context).name;
    String? uid = Provider.of<AuthUserProvider>(context).uid;
    Provider.of<MyCourseProvider>(context).getMyCourse(idUser: uid);
    Failure? failure = Provider.of<CourseUserProvider>(context).failure;
    late Widget component;
    if (courses != null) {
      component = SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage("https://picsum.photos/200/300"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 200,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, $name",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.textPrimary,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text("$role",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF7B8CB5))),
                              ]),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColor.textSecondary,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WishlistPage(
                                idUser: uid!,
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              CarouselAds(),
              IndicatorCarousel(controller: _controller, current: _current),
              const SizedBox(
                height: 16,
              ),
              SearchContainer(
                textController: _textController,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rekomendasi Untukmu",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CourseCard(
                          idUser: uid!,
                          id: courses[index].id!,
                          imageUrl: courses[index].imageUrl,
                          courseName: courses[index].name,
                          mentorName: courses[index].mentor,
                          price: courses[index].price,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kelas Saya",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: myCourse!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: MyCourseCard(
                        imageUrl: myCourse[index].imageUrl,
                        courseName: myCourse[index].name,
                        mentorName: myCourse[index].mentor,
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kelas Populer",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CourseCard(
                          idUser: uid!,
                          id: courses[index].id!,
                          imageUrl: courses[index].imageUrl,
                          courseName: courses[index].name,
                          mentorName: courses[index].mentor,
                          price: courses[index].price,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kelas Gratis",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CourseCard(
                          idUser: uid!,
                          id: courses[index].id!,
                          imageUrl: courses[index].imageUrl,
                          courseName: courses[index].name,
                          mentorName: courses[index].mentor,
                          price: courses[index].price,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (failure != null) {
      component = Scaffold(
        body: Center(
          child: Text(failure.errorMessage),
        ),
      );
    } else {
      component = const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return component;
  }

  CarouselSlider CarouselAds() {
    return CarouselSlider(
      items: [
        "assets/images/Ads_1.png",
        "assets/images/Ads_2.png",
        "assets/images/Ads_3.png",
      ]
          .map((i) => Builder(builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(16)),
                    child: Image.asset(
                      i,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }))
          .toList(),
      options: CarouselOptions(
        height: 150,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) => setState(() {
          _current = index;
        }),
      ),
    );
  }
}

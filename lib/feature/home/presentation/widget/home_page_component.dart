import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/course_card.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/indicator_carousel.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/my_course_card.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/page/wishlist_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  final TextEditingController _textController = TextEditingController();
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("John Doe",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 6,
                            ),
                            Text("Machine Learning Engineer",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7B8CB5))),
                          ]),
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WishlistPage(),
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 48,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFF7B8CB5).withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Mau Belajar Apa Hari Ini?",
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7B8CB5)),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color(0xFF7B8CB5).withOpacity(0.5),
                  border: InputBorder.none,
                  isCollapsed: true,
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 12,
                    minWidth: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    height: 246,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 16,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CourseCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return MyCourseCard();
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    height: 246,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 16,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CourseCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    height: 246,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 16,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CourseCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider CarouselAds() {
    return CarouselSlider(
      items: [1, 2, 3, 4]
          .map((i) => Builder(builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "text $i",
                      style: TextStyle(fontSize: 16),
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
        autoPlayAnimationDuration: Duration(seconds: 2),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) => setState(() {
          _current = index;
        }),
      ),
    );
  }
}

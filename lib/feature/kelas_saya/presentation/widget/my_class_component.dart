import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/entity/my_course_entity.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/provider/my_course_provider.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/widget/categories_component.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/widget/courze_card_my_class.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/presentation/page/play_kelas_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyClassComponent extends StatefulWidget {
  const MyClassComponent({super.key, required this.idUser});
  final String? idUser;
  @override
  _MyClassComponentState createState() => _MyClassComponentState();
}

class _MyClassComponentState extends State<MyClassComponent> {
  var select = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<MyCourseProvider>(context, listen: false)
        .getMyCourse(idUser: widget.idUser!);
    Provider.of<AuthUserProvider>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    List<MyCourseEntity>? myCourse =
        Provider.of<MyCourseProvider>(context).myCourse;
    Failure? failure = Provider.of<MyCourseProvider>(context).failure;
    if (myCourse != null) {
      return Scaffold(
        body: Column(
          children: [
            AppBar(
              leading: null,
              toolbarHeight: 80,
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: Text(
                "Kelas Saya",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.textPrimary,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CategoriesComponent(),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: myCourse.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayKelasPage(id: myCourse[index].id!),
                            settings:
                                RouteSettings(arguments: myCourse[index].id),
                          ),
                        );
                      },
                      child: CourzeCardMyClass(
                        imageUrl: myCourse[index].imageUrl,
                        courseName: myCourse[index].name,
                        mentorName: myCourse[index].mentor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else if (failure != null) {
      return Scaffold(
        body: Center(
          child: Text(failure.errorMessage),
        ),
      );
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

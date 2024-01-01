import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/course_entity_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/lowongan_detail_entity.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/provider/detail_lowongan_provider.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/category_lowongan_widget.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/course_card_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/deskripsi_detail_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/location_text.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/persyaratan_widget.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/perusahaan_text.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/tipe_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/widget/title_widget_lowongan.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetaiLowonganWidget extends StatefulWidget {
  const DetaiLowonganWidget(
      {super.key, required this.id, required this.category});
  final String id;
  final String category;

  @override
  State<DetaiLowonganWidget> createState() => _DetaiLowonganWidgetState();
}

class _DetaiLowonganWidgetState extends State<DetaiLowonganWidget> {
  void initState() {
    super.initState();

    Provider.of<DetailLowonganProvider>(context, listen: false)
        .getDetailLowongan(id: widget.id);
    Provider.of<DetailLowonganProvider>(context, listen: false)
        .getCoursesByCategory(category: widget.category);
    Provider.of<AuthUserProvider>(context, listen: false).getUser();
  }

  Widget rootWidget(Widget widget) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Lowongan",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    DetailLowonganEntity? lowonganEntity = Provider.of<DetailLowonganProvider>(
      context,
    ).detailLowonganEntity;
    List<CourseEntityLowongan>? courseEntityLowongan =
        Provider.of<DetailLowonganProvider>(context).courseEntityLowongan;
    Failure? failure = Provider.of<DetailLowonganProvider>(
      context,
    ).failure;
    String? idUser = Provider.of<AuthUserProvider>(context).uid;
    late Widget widget;
    if (lowonganEntity != null) {
      widget = Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Detail Lowongan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            TittleLowonganWidget(
              title: lowonganEntity.title,
            ),
            const SizedBox(
              height: 8,
            ),
            PerusahaanText(
              perusahaan: lowonganEntity.perusahaan,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                CategoryLowongan(
                  category: lowonganEntity.kategori,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            LocationText(
              location: lowonganEntity.lokasi,
            ),
            const SizedBox(
              height: 10,
            ),
            TipeLowongan(
              tipe: lowonganEntity.tipe,
            ),
            const SizedBox(
              height: 20,
            ),
            DeskripsiWidget(
              deskripsi: lowonganEntity.description,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Persyaratan",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lowonganEntity.persyaratan.length,
              itemBuilder: (context, index) {
                return TextPersyaratan(
                  persyaratan:
                      "${index + 1}. ${lowonganEntity.persyaratan[index]}",
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Kontak",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "• Alamat: ${lowonganEntity.kontak![0].alamat}",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "• Kontak: ${lowonganEntity.kontak![0].nomor}",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "• Email: ${lowonganEntity.kontak![0].email}",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  clipBehavior: Clip.antiAlias,
                  scrollDirection: Axis.horizontal,
                  itemCount: courseEntityLowongan!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: CourseCard(
                        idUser: idUser!,
                        id: courseEntityLowongan[index].id!,
                        courseName: courseEntityLowongan[index].name,
                        mentorName: courseEntityLowongan[index].mentor,
                        price: courseEntityLowongan[index].price,
                        rating: courseEntityLowongan[index].rating,
                        imageUrl: courseEntityLowongan[index].imageUrl,
                      ),
                    );
                  }),
            )
          ],
        ),
      );
    } else if (failure != null) {
      widget = Center(
        child: Text(failure.errorMessage),
      );
    } else {
      widget = Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Lowongan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    print("${lowonganEntity?.id}");
    return widget;
  }
}

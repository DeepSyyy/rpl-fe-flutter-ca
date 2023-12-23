import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/entity/lowongan_entity.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/provider/lowongan_provider.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/category.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/lowongan_container.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/widget/search_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LowonganComponent extends StatefulWidget {
  const LowonganComponent({super.key});

  @override
  State<LowonganComponent> createState() => _LowonganComponentState();
}

class _LowonganComponentState extends State<LowonganComponent> {
  void initState() {
    super.initState();
    Provider.of<LowonganProvider>(context, listen: false).getLowongans();
  }

  @override
  Widget build(BuildContext context) {
    List<LowonganEntity>? lowongan =
        Provider.of<LowonganProvider>(context).lowonganEntities;
    Failure? failure = Provider.of<LowonganProvider>(context).failure;
    late Widget widget;
    if (lowongan != null) {
      widget = Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Lowongan",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColor.textPrimary,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SearchComponent(),
            const SizedBox(
              height: 20,
            ),
            const CategorySlider(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: lowongan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: LowonganContainer(
                      id: lowongan[index].id!,
                      title: lowongan[index].perusahaan,
                      position: lowongan[index].title,
                      category: lowongan[index].kategori,
                      location: lowongan[index].lokasi,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else if (failure != null) {
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
    return widget;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/author_component.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/course_trailer.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/widget/desc_component.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/business/entity/play_kelas_entity.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/presentation/provider/play_kelas_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayKelasComponent extends StatefulWidget {
  const PlayKelasComponent({super.key});

  @override
  State<PlayKelasComponent> createState() => _PlayKelasComponentState();
}

class _PlayKelasComponentState extends State<PlayKelasComponent> {
  @override
  void initState() {
    super.initState();
    Provider.of<PlayKelasProvider>(context, listen: false)
        .getPlayCourse(id: "IeuVocZnbyv8FWtswPW9");
  }

  @override
  Widget build(BuildContext context) {
    PlayKelas? p = Provider.of<PlayKelasProvider>(context).course;
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
          p!.name,
          overflow: TextOverflow.clip,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 16,
              ),
              VideoApp(videoUrl: p.videoUrl),
              const SizedBox(
                height: 16,
              ),
              AuthorComponent(
                author: p.mentor,
              ),
              const SizedBox(
                height: 16,
              ),
              DescCourseComponent(desc: p.description),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonCustom(label: "Assets", onTap: () {}, isExpand: false),
                  const SizedBox(
                    width: 12,
                  ),
                  ButtonCustom(
                      label: "Join Grup", onTap: () {}, isExpand: false),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}

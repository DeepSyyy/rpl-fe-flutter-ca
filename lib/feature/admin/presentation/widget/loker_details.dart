import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/loker_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_loker_provider.dart';
import 'package:provider/provider.dart';

class LokerAdminDetail extends StatefulWidget {
  const LokerAdminDetail({super.key, required this.id});
  final String id;

  @override
  State<LokerAdminDetail> createState() => _LokerAdminDetailState();
}

class _LokerAdminDetailState extends State<LokerAdminDetail> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminLokerProvider>(context, listen: false).getLoker(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    LokerEntity? loker = Provider.of<AdminLokerProvider>(context).loker;
    Failure? failure = Provider.of<AdminLokerProvider>(context).failure;
    late Widget widget;
    if (loker != null) {
      widget = Scaffold(
        appBar: AppBar(
          title: Text(loker.id!),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Text("loker id: ${loker.id!.toString()}"),
              const SizedBox(height: 20),
              Text("loker companyName: ${loker.title.toString()}"),
              const SizedBox(height: 20),
              Text("loker description: ${loker.description.toString()}"),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: loker.persyaratan.length,
                    itemBuilder: (context, index) {
                      return Text(
                          "loker requirements: ${loker.persyaratan[index].toString()}");
                    }),
              ),
              const SizedBox(height: 20),
              Text("loker salary: ${loker.kategori.toString()}"),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: loker.kontak!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                              "loker alamat: ${loker.kontak![index].alamat.toString()}"),
                          Text(
                              "loker email: ${loker.kontak![index].email.toString()}"),
                          Text(
                              "loker nomor: ${loker.kontak![index].nomor.toString()}"),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    } else if (failure != null) {
      widget = Scaffold(
        appBar: AppBar(
          title: const Text('Admin Loker'),
        ),
        body: Center(
          child: Text(failure.errorMessage),
        ),
      );
    } else {
      widget = Scaffold(
        appBar: AppBar(
          title: const Text('Admin Loker'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return widget;
  }
}

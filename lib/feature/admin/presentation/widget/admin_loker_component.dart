import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/loker_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_loker_provider.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/admin_add_loker.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/loker_details.dart';
import 'package:provider/provider.dart';

class AdminLokerComponent extends StatefulWidget {
  const AdminLokerComponent({super.key});

  @override
  State<AdminLokerComponent> createState() => _AdminLokerComponentState();
}

class _AdminLokerComponentState extends State<AdminLokerComponent> {
  void initState() {
    super.initState();
    Provider.of<AdminLokerProvider>(context, listen: false).getLokers();
  }

  @override
  Widget build(BuildContext context) {
    List<LokerEntity>? lokerEntity =
        Provider.of<AdminLokerProvider>(context).lokers;
    Failure? failure = Provider.of<AdminLokerProvider>(context).failure;
    late Widget widget;
    if (lokerEntity != null) {
      widget = Scaffold(
        appBar: AppBar(
          title: Text('Admin Loker'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AddLokerWidget();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: lokerEntity.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LokerAdminDetail(
                        id: lokerEntity[index].id!,
                      );
                    },
                    settings: RouteSettings(
                      arguments: lokerEntity[index].id,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                                "Apakah anda yakin ingin menghapus data ini?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tidak"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  try {
                                    await Provider.of<AdminLokerProvider>(
                                      context,
                                      listen: false,
                                    ).deleteLoker(id: lokerEntity[index].id!);

                                    Navigator.pop(context);

                                    // Show a SnackBar indicating success
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Data Deleted'),
                                      ),
                                    );
                                  } catch (error) {
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Error: $error'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                child: Text("Ya"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                  title: Text(
                      "Nama Perusahaan: ${lokerEntity[index].id!.toString()}"),
                  subtitle: Text(lokerEntity[index].description),
                ),
              ),
            );
          },
        ),
      );
    } else if (failure != null) {
      widget = Scaffold(
        appBar: AppBar(
          title: Text('Admin Loker'),
        ),
        body: Center(
          child: Text(failure.errorMessage),
        ),
      );
    } else {
      widget = Scaffold(
        appBar: AppBar(
          title: Text('Admin Loker'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return widget;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_course_provider.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/admin_add_course_component.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/admin_course_detail_component.dart';
import 'package:provider/provider.dart';

class AdminCourseComponent extends StatefulWidget {
  const AdminCourseComponent({super.key});

  @override
  State<AdminCourseComponent> createState() => _AdminCourseComponentState();
}

class _AdminCourseComponentState extends State<AdminCourseComponent> {
  void initState() {
    super.initState();
    Provider.of<AdminCourseProvider>(context, listen: false).getCourses();
  }

  @override
  Widget build(BuildContext context) {
    List<CourseEntity>? courseEntity =
        Provider.of<AdminCourseProvider>(context).courses;

    Failure? failure = Provider.of<AdminCourseProvider>(context).failure;
    late Widget widget;
    if (courseEntity != null) {
      widget = Scaffold(
        appBar: AppBar(
          title: Text('Admin Course'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AddCoursePage();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: courseEntity.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AdminCourseDetailComponent(
                        id: courseEntity[index].id!,
                      );
                    },
                    settings: RouteSettings(
                      arguments: courseEntity[index].id!,
                    ),
                  ),
                );
              },
              child: ListTile(
                title: Text("ID Course: ${courseEntity[index].id!.toString()}"),
                subtitle:
                    Text("Nama course: ${courseEntity[index].name.toString()}"),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      // Show CircularProgressIndicator
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
                                    await Provider.of<AdminCourseProvider>(
                                      context,
                                      listen: false,
                                    ).deleteCourse(id: courseEntity[index].id!);

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
                    }),
              ),
            );
          },
        ),
      );
    } else if (failure != null) {
      widget = Text(failure.toString());
    } else {
      widget = const CircularProgressIndicator();
    }
    return widget;
  }
}

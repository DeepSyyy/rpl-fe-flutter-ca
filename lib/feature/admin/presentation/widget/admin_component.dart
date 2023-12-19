import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_course_provider.dart';
import 'package:provider/provider.dart';

class AdminCourseComponent extends StatelessWidget {
  const AdminCourseComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<CourseEntity>? courses =
        Provider.of<AdminCourseProvider>(context).courses;
    Failure? failure = Provider.of<AdminCourseProvider>(context).failure;
    late Widget widget;
    if (courses != null) {
      widget = ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index].name),
            subtitle: Text(courses[index].description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<AdminCourseProvider>(context, listen: false)
                    .deleteCourse(courses[index].id);
              },
            ),
          );
        },
      );
    } else if (failure != null) {
      widget = Text(failure.toString());
    } else {
      widget = CircularProgressIndicator();
    }
    return widget;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_course_provider.dart';
import 'package:provider/provider.dart';

class AdminCourseDetailComponent extends StatefulWidget {
  const AdminCourseDetailComponent({super.key, required this.id});

  final String id;

  @override
  State<AdminCourseDetailComponent> createState() =>
      _AdminCourseDetailComponentState();
}

class _AdminCourseDetailComponentState
    extends State<AdminCourseDetailComponent> {
  void initState() {
    super.initState();
    Provider.of<AdminCourseProvider>(context, listen: false)
        .getCourse(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    CourseEntity? course = Provider.of<AdminCourseProvider>(context).course;
    Failure? failure = Provider.of<AdminCourseProvider>(context).failure;
    late Widget widget;
    if (course != null) {
      widget = Scaffold(
        appBar: AppBar(
          title: Text(course.name),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Text("course id: ${course.id!.toString()}"),
              const SizedBox(height: 20),
              Text("course name: ${course.name.toString()}"),
              const SizedBox(height: 20),
              Text("course description: ${course.description.toString()}"),
              const SizedBox(height: 20),
              Text("course rating: ${course.rating.toString()}"),
              const SizedBox(height: 20),
              Text("course mentorName: ${course.mentor.toString()}"),
              const SizedBox(height: 20),
              Text("course imageUrl: ${course.imageUrl.toString()}"),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(course.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: course.keyPoints?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Text(
                        "course keyPoints: ${course.keyPoints![index]}");
                  },
                ),
              ),
              Text("course category: ${course.category.toString()}"),
              Text("course level: ${course.level.toString()}"),
              Text("course price: ${course.price.toString()}"),
              Text("course videoUrl: ${course.videoUrl.toString()}"),
            ],
          ),
        ),
      );
    } else if (failure != null) {
      widget = Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text(failure.errorMessage),
        ),
      );
    } else {
      widget = Scaffold(
        appBar: AppBar(
          title: Text('Loading'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    print("failure: $failure, course: $course");
    return widget;
  }
}

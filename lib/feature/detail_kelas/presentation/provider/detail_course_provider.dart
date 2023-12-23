import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/business/entity/course_entity_detail_course.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/business/usecase/get_course_detail.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/data/datasource/course_detail_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/data/repository/course_detail_repository_impl.dart';

class DetailCourseProvider extends ChangeNotifier {
  CourseEntityDetailCourse? course;
  Failure? failure;

  DetailCourseProvider({
    this.course,
    this.failure,
  });

  void getCourseDetail({required String id}) async {
    CourseDetailRepositoryImpl courseDetailRepositoryImpl =
        CourseDetailRepositoryImpl(
            courseRemoteDataSource: CourseDetailRemoteDataSourceImpl());
    final failureOrSucces =
        await GetCourseDetail(courseDetailRepositoryImpl).call(id: id);

    failureOrSucces.fold(
      (newFailure) {
        course = null;
        failure = newFailure;
        notifyListeners();
      },
      (newCourse) {
        course = null;
        course = newCourse;
        notifyListeners();
      },
    );
  }
}

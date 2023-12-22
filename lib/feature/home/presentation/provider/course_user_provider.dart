import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/home/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/home/business/usecase/get_course_by_category.dart';
import 'package:flutter_fe_rpl/feature/home/business/usecase/get_course_by_name.dart';
import 'package:flutter_fe_rpl/feature/home/business/usecase/get_courses.dart';
import 'package:flutter_fe_rpl/feature/home/data/datasource/course_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/home/data/repository/course_user_repository_impl.dart';

class CourseUserProvider extends ChangeNotifier {
  List<CourseEntity>? courses;
  Failure? failure;

  CourseUserProvider({
    this.courses,
    this.failure,
  });

  void getCourses() async {
    CourseRepositoryUserImpl courseRepositoryUserImpl =
        CourseRepositoryUserImpl(
            courseUserRemoteDataSource: CourseUserRemoteDataSourceImpl());
    final failureOrSucces =
        await GetCoursesUser(courseRepositoryUserImpl).call();
    failureOrSucces.fold(
      (failure) {
        courses = null;
        failure = failure;
        notifyListeners();
      },
      (course) {
        courses = course;
        failure = null;
        notifyListeners();
      },
    );

    void getCoursesByName({required String name}) async {
      CourseRepositoryUserImpl courseRepositoryUserImpl =
          CourseRepositoryUserImpl(
              courseUserRemoteDataSource: CourseUserRemoteDataSourceImpl());
      final failureOrSucces =
          await GetCourseByName(courseRepositoryUserImpl).call(name: name);
      failureOrSucces.fold(
        (failure) {
          courses = null;
          failure = failure;
          notifyListeners();
        },
        (course) {
          courses = course;
          failure = null;
          notifyListeners();
        },
      );
    }

    void getCoursesByCategory({required String category}) async {
      CourseRepositoryUserImpl courseRepositoryUserImpl =
          CourseRepositoryUserImpl(
              courseUserRemoteDataSource: CourseUserRemoteDataSourceImpl());
      final failureOrSucces =
          await GetCourseByCategory(courseRepositoryUserImpl)
              .call(category: category);
      failureOrSucces.fold(
        (failure) {
          courses = null;
          failure = failure;
          notifyListeners();
        },
        (course) {
          courses = course;
          failure = null;
          notifyListeners();
        },
      );
    }
  }
}

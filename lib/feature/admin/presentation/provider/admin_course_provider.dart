import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/course_usecase/add_course.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/course_usecase/delete_course.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/course_usecase/get_course.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/course_usecase/get_courses.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/course_usecase/update_course.dart';
import 'package:flutter_fe_rpl/feature/admin/data/datasource/course_admin_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/admin/data/repository/course_admin_repository_impl.dart';

class AdminCourseProvider extends ChangeNotifier {
  CourseEntity? course;
  List<CourseEntity>? courses;
  Failure? failure;
  String? message;

  AdminCourseProvider({
    this.course,
    this.failure,
  });

  Future<void> deleteCourse({required String id}) async {
    try {
      CourseAdminRepositoryImpl adminCourseRepository =
          CourseAdminRepositoryImpl(
              courseRemoteDataSource: CourseRemoteDataSourceImpl());

      final failureOrSucces =
          await DeleteCourse(adminCourseRepository).call(id);
      failureOrSucces.fold(
        (failure) {
          courses = null;
          failure = failure;
          notifyListeners();
        },
        (voidValue) {
          courses = null;
          message = null;
          getCourses();
          notifyListeners();
        },
      );
      notifyListeners();
    } catch (e) {
      message = e.toString();
      notifyListeners();
    }
  }

  void addCourse({
    required String name,
    required String rating,
    required String description,
    required String imageUrl,
    required String category,
    required String level,
    required String price,
    required String videoUrl,
    List<String>? keyPoints,
    required String createAt,
    required String updateAt,
    required String mentorName,
  }) async {
    try {
      CourseAdminRepositoryImpl adminCourseRepository =
          CourseAdminRepositoryImpl(
              courseRemoteDataSource: CourseRemoteDataSourceImpl());
      final failureOrSucces = await AddCourse(adminCourseRepository).call(
        course: CourseParams(
            name: name,
            description: description,
            rating: rating,
            mentorName: mentorName,
            imageUrl: imageUrl,
            category: category,
            level: level,
            price: price,
            videoUrl: videoUrl,
            keyPoints: keyPoints,
            createAt: createAt,
            updateAt: updateAt),
      );

      failureOrSucces.fold(
        (newFailure) {
          failure = newFailure;
          courses = [];
          notifyListeners();
        },
        (voidValue) {
          failure = null;
          getCourses();
          notifyListeners();
        },
      );
      notifyListeners();
    } catch (e) {
      message = e.toString();
      notifyListeners();
    }
  }

  void updateCourse({
    required String id,
    required String name,
    required String rating,
    required String description,
    required String imageUrl,
    required String category,
    required String level,
    required String price,
    required String videoUrl,
    required String createAt,
    required String updateAt,
    required String mentorName,
  }) async {
    try {
      CourseAdminRepositoryImpl adminCourseRepository =
          CourseAdminRepositoryImpl(
              courseRemoteDataSource: CourseRemoteDataSourceImpl());
      final failureOrSucces = await UpdateCourse(adminCourseRepository).call(
        course: CourseParams(
          id: id,
          name: name,
          rating: rating,
          description: description,
          imageUrl: imageUrl,
          category: category,
          level: level,
          price: price,
          videoUrl: videoUrl,
          createAt: createAt,
          updateAt: updateAt,
          mentorName: mentorName,
        ),
      );

      failureOrSucces.fold(
        (failure) {
          message = failure.errorMessage;
          notifyListeners();
        },
        (voidValue) {
          message = null;
          notifyListeners();
        },
      );
      notifyListeners();
    } catch (e) {
      message = e.toString();
      notifyListeners();
    }
  }

  void getCourses() async {
    CourseAdminRepositoryImpl adminCourseRepository = CourseAdminRepositoryImpl(
        courseRemoteDataSource: CourseRemoteDataSourceImpl());
    final failureOrSucces = await GetCourses(adminCourseRepository).call();

    failureOrSucces.fold(
      (newfailure) {
        courses = null;
        failure = newfailure;
        notifyListeners();
      },
      (newCourse) {
        courses = newCourse;
        failure = null;

        notifyListeners();
      },
    );
    notifyListeners();
  }

  Future<void> getCourse(String id) async {
    CourseAdminRepositoryImpl adminCourseRepository = CourseAdminRepositoryImpl(
        courseRemoteDataSource: CourseRemoteDataSourceImpl());
    final failureOrSucces = await GetCourse(adminCourseRepository).call(id);
    failureOrSucces.fold(
      (failure) {
        message = failure.errorMessage;
        notifyListeners();
      },
      (newCourse) {
        course = newCourse;
        message = null;
        notifyListeners();
      },
    );
    notifyListeners();
  }
}

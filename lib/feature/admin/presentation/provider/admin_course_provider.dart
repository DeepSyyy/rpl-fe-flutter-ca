import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/add_course.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/delete_course.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/update_course.dart';
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

  Future<Either<Failure, void>> deleteCourse(String id) async {
    try {
      CourseAdminRepositoryImpl adminCourseRepository =
          CourseAdminRepositoryImpl(
              courseRemoteDataSource: CourseRemoteDataSourceImpl());

      final failureOrSucces =
          await DeleteCourse(adminCourseRepository).call(id);
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
      return failureOrSucces;
    } catch (e) {
      message = e.toString();
      notifyListeners();
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addCourse({
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
      final failureOrSucces = await AddCourse(adminCourseRepository).call(
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
      ));

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

  Future<void> updateCourse({
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

  Future<Either<Failure, CourseEntity>> getCourses() async {
    try {
      CourseAdminRepositoryImpl adminCourseRepository =
          CourseAdminRepositoryImpl(
              courseRemoteDataSource: CourseRemoteDataSourceImpl());
      final failureOrSucces = await adminCourseRepository.getCourses();

      failureOrSucces.fold(
        (newfailure) {
          failure = newfailure;
          message = newfailure.errorMessage;
          notifyListeners();
          return Left(ServerFailure(errorMessage: newfailure.errorMessage));
        },
        (newCourse) {
          courses = newCourse;
          message = null;
          notifyListeners();
          return Right(newCourse);
        },
      );
      notifyListeners();
    } catch (e) {
      message = e.toString();
      notifyListeners();
    }
    return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
  }

  Future<void> getCourse(String id) async {
    try {
      CourseAdminRepositoryImpl adminCourseRepository =
          CourseAdminRepositoryImpl(
              courseRemoteDataSource: CourseRemoteDataSourceImpl());
      final failureOrSucces = await adminCourseRepository.getCourse(id: id);

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
}

import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/data/model/course_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CourseRemoteDataSource {
  Future<Either<Failure, List<CourseModel>>> getCourses();
  Future<Either<Failure, CourseModel>> getCourse({required String id});
  Future<Either<Failure, void>> addCourse({required CourseParams course});
  Future<Either<Failure, void>> deleteCourse({required String id});
  Future<Either<Failure, void>> updateCourse({required CourseParams course});
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  @override
  Future<Either<Failure, void>> addCourse({required CourseParams course}) {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');
    try {
      CourseModel c = CourseModel.fromParams(course);
      courses.add(c.toJson());
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(
          Left(ServerFailure(errorMessage: 'Data gagal ditambahkan, $e')));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses() async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');
    try {
      final data = await courses.get();
      final coursesData = data.docs
          .map((e) => CourseModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return Right(coursesData);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Data gagal diambil, $e'));
    }
  }

  @override
  Future<Either<Failure, CourseModel>> getCourse({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');
    try {
      final data = await courses.doc(id).get();
      final courseData =
          CourseModel.fromJson(data.data() as Map<String, dynamic>);
      return Right(courseData);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Data gagal diambil, $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');
    try {
      await courses.doc(id).delete();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Data gagal dihapus, $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCourse({required CourseParams course}) {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');
    try {
      CourseModel c = CourseModel.fromParams(course);
      courses.doc(course.id).update(c.toJson());
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(
          Left(ServerFailure(errorMessage: 'Data gagal diupdate, $e')));
    }
  }
}

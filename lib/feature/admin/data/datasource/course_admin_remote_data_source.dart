import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/data/model/course_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CourseRemoteDataSource {
  Future<List<CourseModel>> getCourses();
  Future<Either<Failure, CourseModel>> getCourse({required String id});
  Future<void> addCourse({required CourseParams course});
  Future<Either<Failure, void>> deleteCourse({required String id});
  Future<Either<Failure, void>> updateCourse({required CourseParams course});
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  @override
  Future<void> addCourse({required CourseParams course}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');
    CourseModel c = CourseModel.fromJson(course.toJson());
    await courses.add(c.toJson());
  }

  @override
  Future<List<CourseModel>> getCourses() async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');

    final data = await courses.get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return CourseModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<Either<Failure, CourseModel>> getCourse({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');
    final data = await courses.doc(id).get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = id;
      return Right(CourseModel.fromJson(e));
    } else {
      return Left(ServerFailure(errorMessage: 'Data tidak ditemukan'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');
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
        FirebaseFirestore.instance.collection('course');
    try {
      CourseModel c = CourseModel.fromJson(course.toJson());
      courses.doc(c.id).update(c.toJson());
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(
          Left(ServerFailure(errorMessage: 'Data gagal diupdate, $e')));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/data/model/course_detail_model.dart';

abstract class CourseDetailRemoteDataSource {
  Future<Either<Failure, CourseModelDetailCourse>> getCourseDetail(
      {required String id});
}

class CourseDetailRemoteDataSourceImpl implements CourseDetailRemoteDataSource {
  @override
  Future<Either<Failure, CourseModelDetailCourse>> getCourseDetail(
      {required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');
    final data = await courses.doc(id).get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = id;
      print("${CourseModelDetailCourse.fromJson(e)}");
      return Right(CourseModelDetailCourse.fromJson(e));
    } else {
      return Left(ServerFailure(errorMessage: 'Data tidak ditemukan'));
    }
  }
}

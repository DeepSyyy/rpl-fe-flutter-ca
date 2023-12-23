import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/business/repository/course_repository_detail_course.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/data/datasource/course_detail_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/data/model/course_detail_model.dart';

class CourseDetailRepositoryImpl implements CourseRepositoryDetailCourse {
  final CourseDetailRemoteDataSource courseRemoteDataSource;
  CourseDetailRepositoryImpl({required this.courseRemoteDataSource});
  @override
  Future<Either<Failure, CourseModelDetailCourse>> getCourseDetail(
      {required String id}) async {
    try {
      return await courseRemoteDataSource.getCourseDetail(id: id);
    } catch (e) {
      print(e);
      return Left(
          ServerFailure(errorMessage: 'Tidak dapat mengambil data detail'));
    }
  }
}

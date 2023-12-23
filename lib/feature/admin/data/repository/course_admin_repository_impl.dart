import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/course_admin_repository.dart';
import 'package:flutter_fe_rpl/feature/admin/data/datasource/course_admin_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/admin/data/model/course_model.dart';

class CourseAdminRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource courseRemoteDataSource;
  CourseAdminRepositoryImpl({required this.courseRemoteDataSource});
  @override
  Future<Either<Failure, void>> addCourse(
      {required CourseParams course}) async {
    try {
      await courseRemoteDataSource.addCourse(course: course);
      return Right(null);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal ditambahkan di repo impl, $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse({required String id}) async {
    try {
      return await courseRemoteDataSource.deleteCourse(id: id);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal dihapus di repo impl, $e'));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses() async {
    try {
      final remoteData = await courseRemoteDataSource.getCourses();
      return Right(remoteData);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }

  @override
  Future<Either<Failure, CourseModel>> getCourse({required String id}) async {
    try {
      return await courseRemoteDataSource.getCourse(id: id);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal diambil di repo impl, $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCourse(
      {required CourseParams course}) async {
    try {
      return await courseRemoteDataSource.updateCourse(
        course: course,
      );
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal diupdate di repo impl, $e'));
    }
  }
}

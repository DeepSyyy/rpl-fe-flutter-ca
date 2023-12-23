import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/home/business/repository/course_repository.dart';
import 'package:flutter_fe_rpl/feature/home/data/datasource/course_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/home/data/model/course_model.dart';

class CourseRepositoryUserImpl implements CourseRepositoryUser {
  final CourseUserRemoteDataSource courseUserRemoteDataSource;
  CourseRepositoryUserImpl({required this.courseUserRemoteDataSource});

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses() async {
    try {
      final remoteData = await courseUserRemoteDataSource.getCourses();
      return Right(remoteData);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCourseByCategory(
      {required String category}) async {
    try {
      final remoteData = await courseUserRemoteDataSource.getCourseByCategory(
          category: category);
      return Right(remoteData);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCourseByName(
      {required String nama}) async {
    try {
      final remoteData =
          await courseUserRemoteDataSource.getCourseByName(nama: nama);
      return Right(remoteData);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }
}

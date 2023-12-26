import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/repository/my_course_repository.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/data/datasource/my_course_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/data/model/my_course_model.dart';

class MyCourseRepositoryImpl implements MyCourseRepository {
  final MyCourseRemoteDataSource myCourseRemoteDataSource;
  MyCourseRepositoryImpl({
    required this.myCourseRemoteDataSource,
  });
  @override
  Future<Either<Failure, void>> addMyCourse({
    required String? idUser,
    required String idCourse,
  }) async {
    try {
      await myCourseRemoteDataSource.addMyCourse(
        idUser: idUser!,
        idCourse: idCourse,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror'));
    }
  }

  @override
  Future<Either<Failure, List<MyCourseModel>>> getMyCourse(
      {required String idUser}) async {
    try {
      final result = await myCourseRemoteDataSource.getMyCourse(
        idUser: idUser,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'server error, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, MyCourseModel>> getCourseById(
      {required String idCourse}) async {
    try {
      final result = await myCourseRemoteDataSource.getCourseById(
        idCourse: idCourse,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'server error, coba lagi nanti'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/repository/detail_lowongan_repository.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/data/datasource/detail_lowongan_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/data/model/course_model_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/data/model/detail_lowongan_model.dart';

class DetailLowonganRepositoryImpl extends DetailLowonganRepository {
  final DetailLowonganRemoteDataSource detailLowonganRemoteDataSource;

  DetailLowonganRepositoryImpl({
    required this.detailLowonganRemoteDataSource,
  });

  @override
  Future<Either<Failure, DetailLowonganModel>> getLowongan(
      {required String id}) async {
    try {
      final result = await detailLowonganRemoteDataSource.getLowongan(id: id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Gagal mengambil data"));
    }
  }

  @override
  Future<Either<Failure, List<CourseModelLowongan>>> getCoursesByCategory(
      {required String category}) async {
    try {
      final result = await detailLowonganRemoteDataSource.getCoursesByCategory(
          category: category);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Gagal mengambil data"));
    }
  }
}

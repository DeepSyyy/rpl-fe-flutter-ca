import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/loker_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/loker_admin_repository.dart';
import 'package:flutter_fe_rpl/feature/admin/data/datasource/loker_admin_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/admin/data/model/loker_model.dart';

class LokerAdminRepositoryImpl extends LokerRepository {
  final LokerRemoteDataSource lokerRemoteDataSource;
  LokerAdminRepositoryImpl({required this.lokerRemoteDataSource});

  @override
  Future<Either<Failure, void>> addLoker({required LokerParams loker}) async {
    try {
      await lokerRemoteDataSource.addLoker(lokerParams: loker);
      return Right(null);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal ditambahkan di repo impl, $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteLoker({required String id}) async {
    try {
      return await lokerRemoteDataSource.deleteLoker(id: id);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal dihapus di repo impl, $e'));
    }
  }

  @override
  Future<Either<Failure, List<LokerModel>>> getLokers() async {
    try {
      final remoteData = await lokerRemoteDataSource.getLokers();
      return Right(remoteData);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }

  @override
  Future<Either<Failure, LokerModel>> getLoker({required String id}) async {
    try {
      return await lokerRemoteDataSource.getLoker(id: id);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal diambil di repo impl, $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateLoker(
      {required LokerParams loker}) async {
    try {
      return await lokerRemoteDataSource.updateLoker(
        loker: loker,
      );
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal diupdate di repo impl, $e'));
    }
  }
}

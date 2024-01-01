import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/repository/lowongan_repository.dart';
import 'package:flutter_fe_rpl/feature/lowongan/data/datasource/lowongan_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/lowongan/data/model/lowongan_model.dart';

class LowonganRepositoryImpl implements LowonganRepository {
  final LowonganRemoteDataSource lowonganRemoteDataSource;
  LowonganRepositoryImpl({required this.lowonganRemoteDataSource});
  @override
  Future<Either<Failure, LowonganModel>> getLowongan(
      {required String id}) async {
    try {
      final remoteData = await lowonganRemoteDataSource.getLowongan(id: id);
      return Right(remoteData);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }

  @override
  Future<Either<Failure, List<LowonganModel>>> getLowongans() async {
    try {
      final remoteData = await lowonganRemoteDataSource.getLowongans();
      return Right(remoteData);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }

  @override
  Future<Either<Failure, List<LowonganModel>>> getLowonganByCategory(
      {required String category}) async {
    try {
      final remoteData = await lowonganRemoteDataSource.getLowonganByCategory(
          category: category);
      return Right(remoteData);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }

  @override
  Future<Either<Failure, List<LowonganModel>>> getLowonganByName(
      {required String nama}) async {
    try {
      final remoteData =
          await lowonganRemoteDataSource.getLowonganByName(nama: nama);
      return Right(remoteData);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Gagal mengambil data'));
    }
  }
}

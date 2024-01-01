import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/business/repository/play_kelas_repository.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/data/datasource/play_kelas_data_source.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/data/model/play_kelas_model.dart';

class PlayKelasRepositoryImpl implements PlayKelasRepository {
  final PlayKelasDataSource courseRemoteDataSource;
  PlayKelasRepositoryImpl({
    required this.courseRemoteDataSource,
  });
  @override
  Future<Either<Failure, PlayKelasModel>> getPlayCourse(
      {required String id}) async {
    try {
      return await courseRemoteDataSource.getKelas(id: id);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Tidak dapat mengambil data detail'));
    }
  }
}

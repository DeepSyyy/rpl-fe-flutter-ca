import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/data/model/play_kelas_model.dart';

abstract class PlayKelasDataSource {
  Future<Either<Failure, PlayKelasModel>> getKelas({required String id});
}

class PlayKelasDataSourceImpl implements PlayKelasDataSource {
  @override
  Future<Either<Failure, PlayKelasModel>> getKelas({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');
    final data = await courses.doc(id).get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = id;
      print("${PlayKelasModel.fromJson(e)}");
      return Right(PlayKelasModel.fromJson(e));
    } else {
      return Left(ServerFailure(errorMessage: 'Data tidak ditemukan'));
    }
  }
}

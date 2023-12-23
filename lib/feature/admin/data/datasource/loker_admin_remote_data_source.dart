import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/loker_params.dart';
import 'package:flutter_fe_rpl/feature/admin/data/model/loker_model.dart';

abstract class LokerRemoteDataSource {
  Future<List<LokerModel>> getLokers();
  Future<Either<Failure, LokerModel>> getLoker({required String id});
  Future<void> addLoker({required LokerParams lokerParams});
  Future<Either<Failure, void>> deleteLoker({required String id});
  Future<Either<Failure, void>> updateLoker({required LokerParams loker});
}

class LokerRemoteDataSourceImpl implements LokerRemoteDataSource {
  @override
  Future<void> addLoker({required LokerParams lokerParams}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('loker');
    LokerModel c = LokerModel.fromJson(lokerParams.toJson());
    await courses.add(c.toJson());
  }

  @override
  Future<List<LokerModel>> getLokers() async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('loker');

    final data = await courses.get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return LokerModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<Either<Failure, LokerModel>> getLoker({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('loker');
    final data = await courses.doc(id).get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = id;
      return Right(LokerModel.fromJson(e));
    } else {
      return Left(ServerFailure(errorMessage: 'Data tidak ditemukan'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteLoker({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('loker');
    try {
      await courses.doc(id).delete();
      return Right(null);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal dihapus di repo impl, $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateLoker(
      {required LokerParams loker}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('loker');
    try {
      await courses.doc(loker.id).update(loker.toJson());
      return Right(null);
    } catch (e) {
      return Left(
          ServerFailure(errorMessage: 'Gagal diupdate di repo impl, $e'));
    }
  }
}

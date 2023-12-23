import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fe_rpl/feature/lowongan/data/model/lowongan_model.dart';

abstract class LowonganRemoteDataSource {
  Future<List<LowonganModel>> getLowongans();
  Future<LowonganModel> getLowongan({required String id});
  Future<List<LowonganModel>> getLowonganByCategory({required String category});
  Future<List<LowonganModel>> getLowonganByName({required String nama});
}

class LowonganRemoteDataSourceImpl implements LowonganRemoteDataSource {
  @override
  Future<List<LowonganModel>> getLowonganByCategory(
      {required String category}) async {
    CollectionReference lowongan =
        FirebaseFirestore.instance.collection('loker');
    final data = await lowongan.where('category', isEqualTo: category).get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return LowonganModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<List<LowonganModel>> getLowonganByName({required String nama}) async {
    CollectionReference lowongan =
        FirebaseFirestore.instance.collection('loker');
    final data = await lowongan.where('title', isEqualTo: nama).get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return LowonganModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<List<LowonganModel>> getLowongans() async {
    CollectionReference lowongan =
        FirebaseFirestore.instance.collection('loker');
    final data = await lowongan.get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return LowonganModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<LowonganModel> getLowongan({required String id}) async {
    CollectionReference lowongan =
        FirebaseFirestore.instance.collection('loker');
    final data = await lowongan.doc(id).get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = id;
      return LowonganModel.fromJson(e);
    } else {
      throw Exception('Data Kosong');
    }
  }
}

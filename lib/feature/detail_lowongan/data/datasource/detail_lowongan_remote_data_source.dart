import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/data/model/course_model_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/data/model/detail_lowongan_model.dart';

abstract class DetailLowonganRemoteDataSource {
  Future<List<CourseModelLowongan>> getCoursesByCategory(
      {required String category});
  Future<DetailLowonganModel> getLowongan({required String id});
}

class DetailLowonganRemoteDataSourceImpl
    implements DetailLowonganRemoteDataSource {
  @override
  Future<List<CourseModelLowongan>> getCoursesByCategory(
      {required String category}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');
    final data = await courses.where('category', isEqualTo: category).get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return CourseModelLowongan.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<DetailLowonganModel> getLowongan({required String id}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('loker');
    final data = await courses.doc(id).get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = id;
      return DetailLowonganModel.fromJson(e);
    } else {
      throw Exception('Data Kosong');
    }
  }
}

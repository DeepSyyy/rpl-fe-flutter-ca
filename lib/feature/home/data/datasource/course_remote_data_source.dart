import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fe_rpl/feature/home/data/model/course_model.dart';

abstract class CourseUserRemoteDataSource {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getCourseByCategory({required String category});
  Future<List<CourseModel>> getCourseByName({required String nama});
}

class CourseUserRemoteDataSourceImpl implements CourseUserRemoteDataSource {
  @override
  Future<List<CourseModel>> getCourses() async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');

    final data = await courses.get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return CourseModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<List<CourseModel>> getCourseByCategory(
      {required String category}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');

    final data = await courses.where('category', isEqualTo: category).get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return CourseModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<List<CourseModel>> getCourseByName({required String nama}) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('course');

    final data = await courses.where('name', isEqualTo: nama).get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return CourseModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Data Kosong');
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/data/model/my_course_model.dart';

abstract class MyCourseRemoteDataSource {
  Future<List<MyCourseModel>> getMyCourse({required String? idUser});
  Future<MyCourseModel> getCourseById({required String idCourse});
  Future<void> addMyCourse({required String? idUser, required String idCourse});
}

class MyCourseRemoteDataSourceImpl implements MyCourseRemoteDataSource {
  @override
  Future<void> addMyCourse(
      {required String? idUser, required String idCourse}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('my_courses')
        .add(
      {
        'idCourse': idCourse,
      },
    );
  }

  @override
  Future<MyCourseModel> getCourseById({required String idCourse}) async {
    var data = await FirebaseFirestore.instance
        .collection("course")
        .doc(idCourse)
        .get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = idCourse;
      return MyCourseModel.fromJson(e);
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<List<MyCourseModel>> getMyCourse({required String? idUser}) async {
    List<MyCourseModel> myCourse = [];
    if (idUser != null) {
      final myCourseSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(idUser)
          .collection('my_courses')
          .get();

      for (final doc in myCourseSnapshot.docs) {
        final courseId = doc['idCourse'];

        try {
          final courseDetailResult = await getCourseById(idCourse: courseId);

          final courseDetail = courseDetailResult;
          myCourse.add(courseDetail);
        } catch (e) {
          print('Error fetching course detail sini: ${e.toString()}');
        }
      }

      return myCourse;
    } else {
      throw Exception('Data Kosong');
    }
  }
}

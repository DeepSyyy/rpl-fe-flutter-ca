import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/data/model/course_detail_model.dart';
import 'package:flutter_fe_rpl/feature/wishlist/data/model/course_wishlist_model.dart';

abstract class WishlistRemoteDataSource {
  Future<List<CourseWishlistModel>> getWishlist({required String? idUser});
  Future<bool> addWishlist({required String? idUser, required String idCourse});
  Future<bool> deleteWishlist(
      {required String idCourse, required String idUser});
  Future<CourseWishlistModel> getCoursesById({required String idCourse});
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  @override
  Future<CourseWishlistModel> getCoursesById({required String idCourse}) async {
    var data = await FirebaseFirestore.instance
        .collection("course")
        .doc(idCourse)
        .get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = idCourse;
      return CourseWishlistModel.fromJson(e);
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  // Future<List<CourseWishlistModel>> getWishlist(
  //     {required String? idUser}) async {
  //   List<CourseWishlistModel> wishlist = [];
  //   if (idUser != null) {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(idUser)
  //         .collection('wishlist')
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((element) {
  //         wishlist.add(CourseDetailRemoteDataSourceImpl()
  //             .getCourseDetail(id: element['idCourse']) as CourseWishlistModel);
  //       });
  //     });
  //     return wishlist;
  //   } else {
  //     throw Exception('Data Kosong');
  //   }
  // }

  Future<List<CourseWishlistModel>> getWishlist(
      {required String? idUser}) async {
    List<CourseWishlistModel> wishlist = [];

    if (idUser != null) {
      final wishlistSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(idUser)
          .collection('wishlist')
          .get();

      for (final doc in wishlistSnapshot.docs) {
        final courseId = doc['idCourse'];
        print(doc['idCourse']);

        try {
          final courseDetailResult = await getCoursesById(idCourse: courseId);

          final courseDetail = courseDetailResult;
          wishlist.add(courseDetail);
        } catch (e) {
          print('Error fetching course detail sini: ${e.toString()}');
        }
      }

      return wishlist;
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<bool> addWishlist(
      {required String? idUser, required String idCourse}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(idUser)
        .collection('wishlist')
        .add({'idCourse': idCourse});
    return true;
  }

  Future<bool> deleteWishlist(
      {required String idCourse, required String idUser}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(idUser)
        .collection('wishlist')
        .where('idCourse', isEqualTo: idCourse)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.delete();
      });
    });
    return true;
  }
}

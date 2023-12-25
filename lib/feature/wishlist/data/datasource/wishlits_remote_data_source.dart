import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fe_rpl/feature/wishlist/data/model/course_wishlist_model.dart';

abstract class WishlistRemoteDataSource {
  Future<List<CourseWishlistModel>> getWishlist({required String? idUser});
  Future<bool> addWishlist({required String? idUser, required String idCourse});
  Future<bool> deleteWishlist(
      {required String idCourse, required String idUser});
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  @override
  Future<List<CourseWishlistModel>> getWishlist(
      {required String? idUser}) async {
    var result = await FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('wishlist')
        .get();
    if (result.docs.isNotEmpty) {
      return result.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return CourseWishlistModel.fromJson(data);
      }).toList();
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

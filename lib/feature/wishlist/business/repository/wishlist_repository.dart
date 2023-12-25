import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/entity/course_wislist.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<CourseWishlist>>> getWishlist(
      {required String idUser});
  Future<Either<Failure, bool>> addWishlist(
      {required String? idUser, required String idCourse});
  Future<Either<Failure, bool>> deleteWishlist(
      {required String idCourse, required String idUser});
}

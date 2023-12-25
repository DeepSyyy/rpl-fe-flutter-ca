import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/entity/course_wislist.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/repository/wishlist_repository.dart';

class GetWishlist {
  final WishlistRepository wishlistRepository;

  GetWishlist(this.wishlistRepository);

  Future<Either<Failure, List<CourseWishlist>>> call(
      {required String idUser}) async {
    return await wishlistRepository.getWishlist(idUser: idUser);
  }
}

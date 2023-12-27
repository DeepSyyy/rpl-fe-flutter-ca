import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/repository/wishlist_repository.dart';

class CheckWishlist {
  final WishlistRepository wishlistRepository;

  CheckWishlist(this.wishlistRepository);

  Future<Either<Failure, bool>> call(
      {required String idCourse, required String idUser}) async {
    return await wishlistRepository.checkWishlist(
        idCourse: idCourse, idUser: idUser);
  }
}

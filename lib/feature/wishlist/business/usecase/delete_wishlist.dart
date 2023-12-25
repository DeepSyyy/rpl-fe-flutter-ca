import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/repository/wishlist_repository.dart';

class DeleteWishlist {
  final WishlistRepository wishlistRepository;

  DeleteWishlist(this.wishlistRepository);

  Future<Either<Failure, void>> call(
      {required String idCourse, required String idUser}) async {
    return await wishlistRepository.deleteWishlist(
        idCourse: idCourse, idUser: idUser);
  }
}

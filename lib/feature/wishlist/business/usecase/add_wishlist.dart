import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/repository/wishlist_repository.dart';

class AddWishlist {
  final WishlistRepository wishlistRepository;

  AddWishlist(this.wishlistRepository);

  Future<Either<Failure, bool>> call(
      {required String? idUser, required String idCourse}) async {
    return await wishlistRepository.addWishlist(
        idUser: idUser!, idCourse: idCourse);
  }
}

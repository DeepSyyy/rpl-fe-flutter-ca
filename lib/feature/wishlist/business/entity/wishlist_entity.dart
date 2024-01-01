import 'package:flutter_fe_rpl/feature/wishlist/business/entity/course_wislist.dart';

class WishlistEntity {
  final String id;
  final String idUser;
  final bool isWishlist;
  final List<CourseWishlist> courseWishlist;

  WishlistEntity({
    required this.id,
    required this.idUser,
    required this.isWishlist,
    required this.courseWishlist,
  });
}

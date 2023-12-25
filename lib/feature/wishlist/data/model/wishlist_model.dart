// ignore_for_file: annotate_overrides

import 'package:flutter_fe_rpl/feature/wishlist/business/entity/wishlist_entity.dart';
import 'package:flutter_fe_rpl/feature/wishlist/data/model/course_wishlist_model.dart';

class WishlistModel extends WishlistEntity {
  final String id;
  final String idUser;
  final bool isWishlist;
  final List<CourseWishlistModel> courseWishlist;

  WishlistModel({
    required this.id,
    required this.idUser,
    required this.isWishlist,
    required this.courseWishlist,
  }) : super(
          id: id,
          idUser: idUser,
          isWishlist: isWishlist,
          courseWishlist: courseWishlist,
        );

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        id: json["id"],
        idUser: json["idUser"],
        isWishlist: json["isWishlist"],
        courseWishlist: List<CourseWishlistModel>.from(
            json["courseWishlist"].map((x) => CourseWishlistModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idUser": idUser,
        "isWishlist": isWishlist,
        "courseWishlist":
            List<dynamic>.from(courseWishlist.map((x) => x.toJson())),
      };
}

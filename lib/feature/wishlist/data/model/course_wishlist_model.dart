import 'package:flutter_fe_rpl/feature/wishlist/business/entity/course_wislist.dart';

class CourseWishlistModel extends CourseWishlist {
  String? id;
  final String name;
  final String rating;
  final String description;
  final String imageUrl;
  final String category;
  final String level;
  final String price;
  final String videoUrl;
  List<String>? keyPoints;
  final String createdAt;
  final String updatedAt;
  final String mentor;

  CourseWishlistModel({
    this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.mentor,
    required this.imageUrl,
    required this.category,
    required this.level,
    required this.price,
    required this.videoUrl,
    this.keyPoints,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
          id: id,
          name: name,
          description: description,
          rating: rating,
          mentor: mentor,
          imageUrl: imageUrl,
          category: category,
          level: level,
          price: price,
          videoUrl: videoUrl,
          keyPoints: keyPoints,
          createAt: createdAt,
          updateAt: updatedAt,
        );

  factory CourseWishlistModel.fromJson(Map<String, dynamic> json) =>
      CourseWishlistModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rating: json["rating"],
        mentor: json["mentor"],
        imageUrl: json["imageUrl"],
        category: json["category"],
        level: json["level"],
        price: json["price"],
        videoUrl: json["videoUrl"],
        keyPoints: List<String>.from(json["keyPoints"].map((x) => x)),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rating": rating,
        "mentor": mentor,
        "imageUrl": imageUrl,
        "category": category,
        "level": level,
        "price": price,
        "videoUrl": videoUrl,
        "keyPoints": List<dynamic>.from(keyPoints!.map((x) => x)),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

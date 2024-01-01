class CourseWishlistParams {
  String? id;
  final String name;
  final String rating;
  final String imageUrl;
  final String category;
  final String level;
  final String price;

  CourseWishlistParams({
    this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.category,
    required this.level,
    required this.price,
  });

  factory CourseWishlistParams.fromJson(Map<String, dynamic> json) =>
      CourseWishlistParams(
        id: json["id"],
        name: json["name"],
        rating: json["rating"],
        imageUrl: json["imageUrl"],
        category: json["category"],
        level: json["level"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rating": rating,
        "imageUrl": imageUrl,
        "category": category,
        "level": level,
        "price": price,
      };
}

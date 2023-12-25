class CourseWishlist {
  final String? id;
  final String name;
  final String rating;
  final String imageUrl;
  final String category;
  final String level;
  final String price;

  CourseWishlist({
    this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.category,
    required this.level,
    required this.price,
  });
}

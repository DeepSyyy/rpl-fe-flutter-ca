class CourseEntity {
  final String id;
  final String name;
  final String rating;
  final String description;
  final String imageUrl;
  final String category;
  final String level;
  final String price;
  final String videoUrl;
  final String createAt;
  final String updateAt;
  final String mentorName;

  CourseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.mentorName,
    required this.imageUrl,
    required this.category,
    required this.level,
    required this.price,
    required this.videoUrl,
    required this.createAt,
    required this.updateAt,
  });
}

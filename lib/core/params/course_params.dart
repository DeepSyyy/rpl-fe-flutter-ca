class CourseParams {
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
  final String createAt;
  final String updateAt;
  final String mentorName;

  CourseParams({
    this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.mentorName,
    required this.imageUrl,
    required this.category,
    required this.level,
    required this.price,
    required this.videoUrl,
    this.keyPoints,
    required this.createAt,
    required this.updateAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'rating': rating,
      'mentor': mentorName,
      'imageUrl': imageUrl,
      'category': category,
      'level': level,
      'price': price,
      'videoUrl': videoUrl,
      'keyPoints': keyPoints,
      'createdAt': createAt,
      'updatedAt': updateAt,
    };
  }
}

class AddCourseParams {
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

  AddCourseParams({
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

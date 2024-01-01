import 'package:flutter_fe_rpl/feature/detail_kelas/business/entity/course_entity_detail_course.dart';

class PlayKelasModel extends CourseEntityDetailCourse {
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
  final String mentor;

  PlayKelasModel({
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
    required this.createAt,
    required this.updateAt,
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
          createAt: createAt,
          updateAt: updateAt,
        );

  factory PlayKelasModel.fromJson(Map<String, dynamic> json) {
    return PlayKelasModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      mentor: json['mentor'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      level: json['level'],
      price: json['price'],
      videoUrl: json['videoUrl'],
      keyPoints: json['keyPoints'] != null
          ? List<String>.from(json['keyPoints'])
          : null,
      createAt: json['createdAt'],
      updateAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'rating': rating,
      'mentor': mentor,
      'imageUrl': imageUrl,
      'category': category,
      'level': level,
      'price': price,
      'videoUrl': videoUrl,
      'keyPoints': keyPoints,
      'createAt': createAt,
      'updateAt': updateAt,
    };
  }
}

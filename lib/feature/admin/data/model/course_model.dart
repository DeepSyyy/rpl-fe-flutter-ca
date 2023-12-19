import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';

class CourseModel extends CourseEntity {
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

  CourseModel({
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
  }) : super(
          id: id,
          name: name,
          description: description,
          rating: rating,
          mentorName: mentorName,
          imageUrl: imageUrl,
          category: category,
          level: level,
          price: price,
          videoUrl: videoUrl,
          createAt: createAt,
          updateAt: updateAt,
        );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      mentorName: json['mentorName'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      level: json['level'],
      price: json['price'],
      videoUrl: json['videoUrl'],
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
      'mentor': mentorName,
      'imageUrl': imageUrl,
      'category': category,
      'level': level,
      'price': price,
      'videoUrl': videoUrl,
      'createdAt': createAt,
      'updatedAt': updateAt,
    };
  }

  static fromParams(CourseParams course) {
    return CourseModel(
      id: course.id,
      name: course.name,
      description: course.description,
      rating: course.rating,
      mentorName: course.mentorName,
      imageUrl: course.imageUrl,
      category: course.category,
      level: course.level,
      price: course.price,
      videoUrl: course.videoUrl,
      createAt: course.createAt,
      updateAt: course.updateAt,
    );
  }
}

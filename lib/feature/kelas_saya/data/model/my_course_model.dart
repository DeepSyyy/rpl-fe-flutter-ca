import 'package:flutter_fe_rpl/feature/kelas_saya/business/entity/my_course_entity.dart';

class MyCourseModel extends MyCourseEntity {
  @override
  String? id;
  @override
  final String name;
  @override
  final String rating;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final String category;
  @override
  final String level;
  @override
  final String price;
  @override
  final String videoUrl;
  @override
  List<String>? keyPoints;
  @override
  final String createAt;
  @override
  final String updateAt;
  @override
  final String mentor;

  MyCourseModel({
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

  factory MyCourseModel.fromJson(Map<String, dynamic> json) => MyCourseModel(
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
        createAt: json["createdAt"],
        updateAt: json["updatedAt"],
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
        "createdAt": createAt,
        "updatedAt": updateAt,
      };
}

import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/course_entity_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/repository/detail_lowongan_repository.dart';

class GetCoursesByCategory {
  final DetailLowonganRepository courseRepository;

  GetCoursesByCategory(this.courseRepository);

  Future<Either<Failure, List<CourseEntityLowongan>>> execute(
      {required String category}) async {
    return await courseRepository.getCoursesByCategory(category: category);
  }
}

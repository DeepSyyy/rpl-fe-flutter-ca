import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/home/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/home/business/repository/course_repository.dart';

class GetCourseByCategory {
  final CourseRepositoryUser courseRepository;

  GetCourseByCategory(this.courseRepository);

  Future<Either<Failure, List<CourseEntity>>> call(
      {required String category}) async {
    return await courseRepository.getCourseByCategory(category: category);
  }
}

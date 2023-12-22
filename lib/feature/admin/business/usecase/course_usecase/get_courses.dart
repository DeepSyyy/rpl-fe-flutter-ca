import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/course_admin_repository.dart';

class GetCourses {
  final CourseRepository courseRepository;

  GetCourses(this.courseRepository);

  Future<Either<Failure, List<CourseEntity>>> call() async {
    return await courseRepository.getCourses();
  }
}

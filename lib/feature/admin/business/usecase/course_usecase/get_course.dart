import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/course_admin_repository.dart';

class GetCourse {
  final CourseRepository courseRepository;

  GetCourse(this.courseRepository);

  Future<Either<Failure, CourseEntity>> call(String id) async {
    return await courseRepository.getCourse(id: id);
  }
}

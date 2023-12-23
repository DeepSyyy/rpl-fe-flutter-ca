import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/course_admin_repository.dart';

class UpdateCourse {
  final CourseRepository courseRepository;

  UpdateCourse(this.courseRepository);

  Future<Either<Failure, void>> call({required CourseParams course}) async {
    return await courseRepository.updateCourse(course: course);
  }
}

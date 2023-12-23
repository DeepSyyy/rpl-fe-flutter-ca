import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/course_admin_repository.dart';

class DeleteCourse {
  final CourseRepository courseRepository;

  DeleteCourse(this.courseRepository);

  Future<Either<Failure, void>> call(String id) async {
    return await courseRepository.deleteCourse(id: id);
  }
}

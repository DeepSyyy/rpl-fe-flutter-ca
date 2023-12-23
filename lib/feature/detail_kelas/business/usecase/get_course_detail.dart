import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/business/entity/course_entity_detail_course.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/business/repository/course_repository_detail_course.dart';

class GetCourseDetail {
  final CourseRepositoryDetailCourse courseRepository;

  GetCourseDetail(this.courseRepository);

  Future<Either<Failure, CourseEntityDetailCourse>> call(
      {required String id}) async {
    return await courseRepository.getCourseDetail(id: id);
  }
}

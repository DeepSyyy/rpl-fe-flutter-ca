import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/business/entity/course_entity_detail_course.dart';

abstract class CourseRepositoryDetailCourse {
  Future<Either<Failure, CourseEntityDetailCourse>> getCourseDetail(
      {required String id});
}

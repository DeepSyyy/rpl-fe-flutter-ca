import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/course_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/course_entity.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getCourses();
  Future<Either<Failure, CourseEntity>> getCourse({required String id});
  Future<Either<Failure, void>> addCourse({required CourseParams course});
  Future<Either<Failure, void>> deleteCourse({required String id});
  Future<Either<Failure, void>> updateCourse({required CourseParams course});
}

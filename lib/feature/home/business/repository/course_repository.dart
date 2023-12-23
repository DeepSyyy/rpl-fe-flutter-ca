import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/home/business/entity/course_entity.dart';

abstract class CourseRepositoryUser {
  Future<Either<Failure, List<CourseEntity>>> getCourses();
  Future<Either<Failure, List<CourseEntity>>> getCourseByCategory(
      {required String category});
  Future<Either<Failure, List<CourseEntity>>> getCourseByName(
      {required String nama});
}

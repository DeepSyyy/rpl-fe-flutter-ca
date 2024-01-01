import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/entity/my_course_entity.dart';

abstract class MyCourseRepository {
  Future<Either<Failure, List<MyCourseEntity>>> getMyCourse(
      {required String idUser});
  Future<Either<Failure, MyCourseEntity>> getCourseById({
    required String idCourse,
  });
  Future<Either<Failure, void>> addMyCourse({
    required String? idUser,
    required String idCourse,
  });
}

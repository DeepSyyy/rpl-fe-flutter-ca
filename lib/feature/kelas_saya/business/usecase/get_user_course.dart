import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/entity/my_course_entity.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/repository/my_course_repository.dart';

class GetUserCourse {
  final MyCourseRepository myCourseRepository;

  GetUserCourse(this.myCourseRepository);

  Future<Either<Failure, List<MyCourseEntity>>> call(
      {required String idUser}) async {
    return await myCourseRepository.getMyCourse(idUser: idUser);
  }
}

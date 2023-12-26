import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/repository/my_course_repository.dart';

class AddUserCourse {
  final MyCourseRepository myUserRepository;

  AddUserCourse(this.myUserRepository);

  Future<Either<Failure, void>> call(
      {required String idCourse, required String? idUser}) async {
    return await myUserRepository.addMyCourse(
        idCourse: idCourse, idUser: idUser!);
  }
}

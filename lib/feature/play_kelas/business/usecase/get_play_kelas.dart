import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/business/entity/play_kelas_entity.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/business/repository/play_kelas_repository.dart';

class GetPlayKelas {
  final PlayKelasRepository courseRepository;

  GetPlayKelas(this.courseRepository);

  Future<Either<Failure, PlayKelas>> call({required String id}) async {
    return await courseRepository.getPlayCourse(id: id);
  }
}

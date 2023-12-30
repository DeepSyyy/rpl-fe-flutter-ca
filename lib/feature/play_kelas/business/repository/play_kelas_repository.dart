import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/business/entity/play_kelas_entity.dart';

abstract class PlayKelasRepository {
  Future<Either<Failure, PlayKelas>> getPlayCourse({required String id});
}

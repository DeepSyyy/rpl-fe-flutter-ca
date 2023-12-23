import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/course_entity_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/lowongan_detail_entity.dart';

abstract class DetailLowonganRepository {
  Future<Either<Failure, List<CourseEntityLowongan>>> getCoursesByCategory({
    required String category,
  });
  Future<Either<Failure, DetailLowonganEntity>> getLowongan(
      {required String id});
}

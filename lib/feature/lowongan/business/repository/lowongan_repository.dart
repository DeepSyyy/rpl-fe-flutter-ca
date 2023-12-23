import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/entity/lowongan_entity.dart';

abstract class LowonganRepository {
  Future<Either<Failure, LowonganEntity>> getLowongan({required String id});
  Future<Either<Failure, List<LowonganEntity>>> getLowongans();
  Future<Either<Failure, List<LowonganEntity>>> getLowonganByCategory(
      {required String category});
  Future<Either<Failure, List<LowonganEntity>>> getLowonganByName(
      {required String nama});
}

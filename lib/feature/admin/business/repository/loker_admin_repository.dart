import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/loker_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/loker_entity.dart';

abstract class LokerRepository {
  Future<Either<Failure, void>> addLoker({required LokerParams loker});
  Future<Either<Failure, LokerEntity>> getLoker({required String id});
  Future<Either<Failure, void>> deleteLoker({required String id});
  Future<Either<Failure, void>> updateLoker({required LokerParams loker});
  Future<Either<Failure, List<LokerEntity>>> getLokers();
}

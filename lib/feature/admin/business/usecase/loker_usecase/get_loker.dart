import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/loker_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/loker_admin_repository.dart';

class GetLoker {
  final LokerRepository lokerRepository;

  GetLoker(this.lokerRepository);

  Future<Either<Failure, LokerEntity>> call({
    required String id,
  }) async {
    return await lokerRepository.getLoker(id: id);
  }
}

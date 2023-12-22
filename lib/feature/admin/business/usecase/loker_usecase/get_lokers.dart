import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/loker_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/loker_admin_repository.dart';

class GetLokers {
  final LokerRepository lokerRepository;

  GetLokers(this.lokerRepository);

  Future<Either<Failure, List<LokerEntity>>> call() async {
    return await lokerRepository.getLokers();
  }
}

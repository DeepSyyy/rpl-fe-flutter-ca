import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/loker_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/loker_admin_repository.dart';

class UpdateLoker {
  final LokerRepository lokerRepository;

  UpdateLoker(this.lokerRepository);

  Future<Either<Failure, void>> call({
    required LokerParams lokerParams,
  }) async {
    return await lokerRepository.updateLoker(
      loker: lokerParams,
    );
  }
}

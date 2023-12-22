import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/admin/business/repository/loker_admin_repository.dart';

class DeleteLoker {
  final LokerRepository lokerRepository;

  DeleteLoker(this.lokerRepository);

  Future<Either<Failure, void>> call({required String id}) async {
    return await lokerRepository.deleteLoker(id: id);
  }
}

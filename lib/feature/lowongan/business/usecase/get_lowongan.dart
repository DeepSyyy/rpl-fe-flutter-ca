import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/entity/lowongan_entity.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/repository/lowongan_repository.dart';

class GetLowongan {
  final LowonganRepository lowonganRepository;

  GetLowongan(this.lowonganRepository);

  Future<Either<Failure, LowonganEntity>> call({required String id}) async {
    return await lowonganRepository.getLowongan(id: id);
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/lowongan_detail_entity.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/repository/detail_lowongan_repository.dart';

class GetLowongan {
  final DetailLowonganRepository lowonganRepository;

  GetLowongan(this.lowonganRepository);

  Future<Either<Failure, DetailLowonganEntity>> call(
      {required String id}) async {
    return await lowonganRepository.getLowongan(id: id);
  }
}

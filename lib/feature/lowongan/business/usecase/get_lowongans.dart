import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/entity/lowongan_entity.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/repository/lowongan_repository.dart';

class GetLowongans {
  final LowonganRepository lowonganRepository;

  GetLowongans(this.lowonganRepository);

  Future<Either<Failure, List<LowonganEntity>>> call() async {
    return await lowonganRepository.getLowongans();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/entity/lowongan_entity.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/usecase/get_lowongan.dart';
import 'package:flutter_fe_rpl/feature/lowongan/business/usecase/get_lowongans.dart';
import 'package:flutter_fe_rpl/feature/lowongan/data/datasource/lowongan_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/lowongan/data/repository/lowongan_repository_impl.dart';

class LowonganProvider extends ChangeNotifier {
  LowonganEntity? lowonganEntity;
  List<LowonganEntity>? lowonganEntities;
  Failure? failure;

  LowonganProvider({
    this.lowonganEntity,
    this.lowonganEntities,
    this.failure,
  });

  void getLowongan({required String id}) async {
    LowonganRepositoryImpl lowonganRepositoryImpl = LowonganRepositoryImpl(
        lowonganRemoteDataSource: LowonganRemoteDataSourceImpl());
    final failureOrSucces =
        await GetLowongan(lowonganRepositoryImpl).call(id: id);

    failureOrSucces.fold(
      (failure) {
        lowonganEntity = null;
        failure = failure;
        notifyListeners();
      },
      (lowongan) {
        lowonganEntity = null;
        lowonganEntity = lowongan;
        failure = null;
        notifyListeners();
      },
    );
  }

  void getLowongans() async {
    LowonganRepositoryImpl lowonganRepositoryImpl = LowonganRepositoryImpl(
        lowonganRemoteDataSource: LowonganRemoteDataSourceImpl());
    final failureOrSucces = await GetLowongans(lowonganRepositoryImpl).call();

    failureOrSucces.fold(
      (failure) {
        lowonganEntities = null;
        failure = failure;
        notifyListeners();
      },
      (lowongan) {
        lowonganEntities = null;
        lowonganEntities = lowongan;
        failure = null;
        notifyListeners();
      },
    );
  }
}

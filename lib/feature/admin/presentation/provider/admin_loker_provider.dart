import 'package:flutter/foundation.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/loker_params.dart';
import 'package:flutter_fe_rpl/feature/admin/business/entity/loker_entity.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/loker_usecase/add_loker.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/loker_usecase/delete_loker.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/loker_usecase/get_loker.dart';
import 'package:flutter_fe_rpl/feature/admin/business/usecase/loker_usecase/get_lokers.dart';
import 'package:flutter_fe_rpl/feature/admin/data/datasource/loker_admin_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/admin/data/repository/loker_admin_repository_impl.dart';

class AdminLokerProvider extends ChangeNotifier {
  LokerEntity? loker;
  List<LokerEntity>? lokers;
  Failure? failure;
  String? message;

  AdminLokerProvider({
    this.loker,
    this.lokers,
    this.failure,
    this.message,
  });

  void addLoker({
    required String title,
    required String kategori,
    required String perusahaan,
    required String lokasi,
    required String tipe,
    required String description,
    required List<String> persyaratan,
    required List<KontakParams> kontak,
  }) async {
    try {
      LokerAdminRepositoryImpl adminLokerRepository = LokerAdminRepositoryImpl(
          lokerRemoteDataSource: LokerRemoteDataSourceImpl());
      final failureOrSucces = await AddLoker(adminLokerRepository).call(
        lokerParams: LokerParams(
            title: title,
            kategori: kategori,
            perusahaan: perusahaan,
            lokasi: lokasi,
            tipe: tipe,
            description: description,
            persyaratan: persyaratan,
            kontak: kontak),
      );

      failureOrSucces.fold(
        (newFailure) {
          failure = newFailure;
          lokers = [];
          notifyListeners();
        },
        (voidValue) {
          failure = null;
          getLokers();
          notifyListeners();
        },
      );
      notifyListeners();
    } catch (e) {
      message = e.toString();
      notifyListeners();
    }
  }

  void getLokers() async {
    LokerAdminRepositoryImpl lokerAdminRepositoryImpl =
        LokerAdminRepositoryImpl(
            lokerRemoteDataSource: LokerRemoteDataSourceImpl());
    final failureOrSucces = await GetLokers(lokerAdminRepositoryImpl).call();

    failureOrSucces.fold(
      (newfailure) {
        lokers = null;
        failure = newfailure;
        notifyListeners();
      },
      (newLokers) {
        lokers = newLokers;
        failure = null;

        notifyListeners();
      },
    );
    notifyListeners();
  }

  Future<void> deleteLoker({required String id}) async {
    LokerAdminRepositoryImpl lokerAdminRepositoryImpl =
        LokerAdminRepositoryImpl(
            lokerRemoteDataSource: LokerRemoteDataSourceImpl());
    final failureOrSucces = await DeleteLoker(lokerAdminRepositoryImpl).call(
      id: id,
    );

    failureOrSucces.fold(
      (newfailure) {
        lokers = null;
        failure = newfailure;
        notifyListeners();
      },
      (voidValue) {
        lokers = null;
        failure = null;
        getLokers();
        notifyListeners();
      },
    );
    notifyListeners();
  }

  void getLoker(String id) async {
    LokerAdminRepositoryImpl lokerAdminRepositoryImpl =
        LokerAdminRepositoryImpl(
            lokerRemoteDataSource: LokerRemoteDataSourceImpl());
    final failureOrSucces =
        await GetLoker(lokerAdminRepositoryImpl).call(id: id);

    failureOrSucces.fold(
      (failure) {
        message = failure.errorMessage;
        notifyListeners();
      },
      (newLoker) {
        loker = newLoker;
        message = null;
        notifyListeners();
      },
    );
    notifyListeners();
  }
}

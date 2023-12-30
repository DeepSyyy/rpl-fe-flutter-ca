import 'package:flutter/foundation.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/business/entity/play_kelas_entity.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/business/usecase/get_play_kelas.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/data/datasource/play_kelas_data_source.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/data/repository/play_kelas_repository_impl.dart';

class DetailCourseProvider extends ChangeNotifier {
  PlayKelas? course;
  Failure? failure;

  DetailCourseProvider({
    this.course,
    this.failure,
  });

  void getPlayCourse({required String id}) async {
    PlayKelasRepositoryImpl playKelasRepositoryImpl = PlayKelasRepositoryImpl(
      courseRemoteDataSource: PlayKelasDataSourceImpl(),
    );
    final failureOrSucces =
        await GetPlayKelas(playKelasRepositoryImpl).call(id: id);

    failureOrSucces.fold(
      (newFailure) {
        course = null;
        failure = newFailure;
        notifyListeners();
      },
      (newCourse) {
        course = null;
        course = newCourse;
        notifyListeners();
      },
    );
  }
}

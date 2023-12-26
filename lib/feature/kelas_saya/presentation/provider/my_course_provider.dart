import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/business/entity/my_course_entity.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/data/datasource/my_course_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/data/repository/my_course_repository_impl.dart';

class MyCourseProvider extends ChangeNotifier {
  List<MyCourseEntity>? myCourse = [];
  Failure? failure;

  Future<void> addMyCourse({
    required String? idUser,
    required String idCourse,
  }) async {
    MyCourseRepositoryImpl repo = MyCourseRepositoryImpl(
        myCourseRemoteDataSource: MyCourseRemoteDataSourceImpl());

    final result = await repo.addMyCourse(idUser: idUser, idCourse: idCourse);

    result.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (voidValue) {
      failure = null;
      notifyListeners();
    });
  }

  Future<void> getMyCourse({required String idUser}) async {
    MyCourseRepositoryImpl repo = MyCourseRepositoryImpl(
        myCourseRemoteDataSource: MyCourseRemoteDataSourceImpl());

    final result = await repo.getMyCourse(idUser: idUser);

    result.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (myCourse) {
      this.myCourse = null;
      this.myCourse = myCourse;
      failure = null;
      notifyListeners();
    });
  }
}

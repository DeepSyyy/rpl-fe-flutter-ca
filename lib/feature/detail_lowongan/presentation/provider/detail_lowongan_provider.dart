import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/course_entity_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/entity/lowongan_detail_entity.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/usecase/get_courses_by_category.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/business/usecase/get_detail_lowongan.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/data/datasource/detail_lowongan_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/data/repository/detail_lowongan_repository_impl.dart';

class DetailLowonganProvider extends ChangeNotifier {
  DetailLowonganEntity? detailLowonganEntity;
  List<CourseEntityLowongan>? courseEntityLowongan;
  Failure? failure;

  DetailLowonganProvider({
    this.detailLowonganEntity,
    this.courseEntityLowongan,
    this.failure,
  });

  void getDetailLowongan({required String id}) async {
    DetailLowonganRepositoryImpl repo = DetailLowonganRepositoryImpl(
        detailLowonganRemoteDataSource: DetailLowonganRemoteDataSourceImpl());
    final failureOrSucces = await GetLowongan(repo).call(id: id);

    failureOrSucces.fold(
      (failure) {
        detailLowonganEntity = null;
        failure = failure;
        notifyListeners();
      },
      (detailLowongan) {
        print(detailLowongan);
        detailLowonganEntity = detailLowongan;
        failure = null;
        notifyListeners();
      },
    );
  }

  void getCoursesByCategory({required String category}) async {
    DetailLowonganRepositoryImpl repo = DetailLowonganRepositoryImpl(
        detailLowonganRemoteDataSource: DetailLowonganRemoteDataSourceImpl());
    final failureOrSucces =
        await GetCoursesByCategory(repo).execute(category: category);

    failureOrSucces.fold(
      (failure) {
        courseEntityLowongan = null;
        failure = failure;
        notifyListeners();
      },
      (course) {
        courseEntityLowongan = null;
        courseEntityLowongan = course;
        failure = null;
        notifyListeners();
      },
    );
  }
}

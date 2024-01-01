import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/transaksi/business/entity/course_detail_transacttion.dart';
import 'package:flutter_fe_rpl/feature/transaksi/business/repository/transaction_repository.dart';

class GetCourseTransaction {
  final TransactionHistoryRepository repo;

  GetCourseTransaction(this.repo);

  Future<Either<Failure, CourseDetailTransaction>> call(
      {required String idCourse}) async {
    return await repo.getCourseTransaction(idCourse: idCourse);
  }
}

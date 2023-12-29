import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/business/entity/course_detail_entity_transaction.dart';

abstract class TransactionHistoryRepository {
  Future<Either<Failure, List<CourseDetailTransaction>>> getTransaction(
      {required String idUser});
  Future<Either<Failure, void>> addTransaction(
      {required String idCourse, required String idUser});
  Future<Either<Failure, CourseDetailTransaction>> getCourseTransaction(
      {required String idCourse});
}

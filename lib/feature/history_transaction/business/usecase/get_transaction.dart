import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/business/entity/course_detail_entity_transaction.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/business/repository/transaction_repository.dart';

class GetTransaction {
  final TransactionHistoryRepository repo;

  GetTransaction(this.repo);

  Future<Either<Failure, List<CourseDetailTransaction>>> call(
      {required String idUser}) async {
    return await repo.getTransaction(idUser: idUser);
  }
}

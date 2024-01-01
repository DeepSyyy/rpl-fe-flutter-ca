import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/transaksi/business/repository/transaction_repository.dart';

class AddTransaction {
  final TransactionHistoryRepository repo;

  AddTransaction(this.repo);

  Future<Either<Failure, void>> call(
      {required String idUser, required String idCourse}) async {
    return await repo.addTransaction(idCourse: idCourse, idUser: idUser);
  }
}

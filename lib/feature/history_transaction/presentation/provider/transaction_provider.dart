import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/business/entity/course_detail_entity_transaction.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/business/usecase/add_transaction.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/data/datasource/transaction_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/data/repository/transaction_history_impl.dart';

class TransactionProvider extends ChangeNotifier {
  List<CourseDetailTransaction>? transactionList;
  Failure? failure;

  TransactionProvider({this.transactionList, this.failure});

  Future<void> addTransaction({
    required String idCourse,
    required String idUser,
  }) async {
    TransactionHistoryRepositoryImpl repo = TransactionHistoryRepositoryImpl(
        remoteDataSource: TransactionRemoteDataSourceImpl());
    final failureOrSuccess =
        await AddTransaction(repo).call(idUser: idUser, idCourse: idCourse);

    failureOrSuccess.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (voidValue) {
      failure = null;
      notifyListeners();
    });
  }

  Future<void> getTransaction({required String idUser}) async {
    TransactionHistoryRepositoryImpl repo = TransactionHistoryRepositoryImpl(
        remoteDataSource: TransactionRemoteDataSourceImpl());
    final failureOrSuccess = await repo.getTransaction(idUser: idUser);

    failureOrSuccess.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (transaction) {
      transactionList = null;
      transactionList = transaction;
      failure = null;
      notifyListeners();
    });
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/business/repository/transaction_repository.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/data/datasource/transaction_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/history_transaction/data/model/course_detail_transaction_model.dart';

class TransactionHistoryRepositoryImpl implements TransactionHistoryRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionHistoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CourseDetailTransactionModel>>> getTransaction(
      {required String idUser}) async {
    try {
      final result = await remoteDataSource.getTransactions(idUser: idUser);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror'));
    }
  }

  @override
  Future<Either<Failure, void>> addTransaction(
      {required String idCourse, required String idUser}) async {
    try {
      final result = await remoteDataSource.addTransaction(
        idCourse: idCourse,
        idUser: idUser,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror'));
    }
  }

  @override
  Future<Either<Failure, CourseDetailTransactionModel>> getCourseTransaction(
      {required String idCourse}) async {
    try {
      final result =
          await remoteDataSource.getCourseTransaction(idCourse: idCourse);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror'));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fe_rpl/feature/transaksi/data/model/course_detail_transaction.dart';

abstract class TransactionRemoteDataSource {
  Future<List<CourseDetailTransactionModel>> getTransactions(
      {required String idUser});
  Future<void> addTransaction(
      {required String idCourse, required String idUser});
  Future<CourseDetailTransactionModel> getCourseTransaction(
      {required String idCourse});
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  @override
  Future<void> addTransaction(
      {required String idCourse, required String idUser}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(idUser)
        .collection('transactions')
        .add(
      {
        'idCourse': idCourse,
      },
    );
  }

  @override
  Future<CourseDetailTransactionModel> getCourseTransaction(
      {required String idCourse}) async {
    var data = await FirebaseFirestore.instance
        .collection("course")
        .doc(idCourse)
        .get();
    if (data.exists) {
      final e = data.data() as Map<String, dynamic>;
      e['id'] = idCourse;
      return CourseDetailTransactionModel.fromJson(e);
    } else {
      throw Exception('Data Kosong');
    }
  }

  @override
  Future<List<CourseDetailTransactionModel>> getTransactions(
      {required String? idUser}) async {
    List<CourseDetailTransactionModel> transactions = [];
    if (idUser != null) {
      final transactionSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(idUser)
          .collection('transactions')
          .get();

      for (final doc in transactionSnapshot.docs) {
        final courseId = doc['idCourse'];

        try {
          final courseDetailResult =
              await getCourseTransaction(idCourse: courseId);

          final courseDetail = courseDetailResult;
          transactions.add(courseDetail);
        } catch (e) {
          print('Error fetching course detail sini: ${e.toString()}');
        }
      }
    }
    return transactions;
  }
}

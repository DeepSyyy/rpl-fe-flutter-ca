import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';

abstract class EditProfileUserRemoteDataSource {
  Future<Either<Failure, void>> editProfile({required String name});
}

class EditProfileUserRemoteDataSourceImpl
    implements EditProfileUserRemoteDataSource {
  @override
  Future<Either<Failure, void>> editProfile({required String name}) async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        user.updateDisplayName(name);

        final CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        users.doc(user.uid).update({
          'name': name,
        });
      }
      return Right(null);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';

abstract class SignUpRemoteDataSource {
  Future<Either<Failure, void>> signUp(
      {required UserParamsRegister userParamsRegister});
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  @override
  Future<Either<Failure, void>> signUp(
      {required UserParamsRegister userParamsRegister}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userParamsRegister.email,
        password: userParamsRegister.password,
      );
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(credential.user!.uid).set({
        'password': userParamsRegister.password, // tambahin password
        'name': userParamsRegister.name,
        'email': userParamsRegister.email,
        'role': userParamsRegister.role,
        'uid': credential.user!.uid,
      });
      credential.user!.updateDisplayName(userParamsRegister.name);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(
            ServerFailure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return Left(ServerFailure(
            errorMessage: 'The account already exists for that email.'));
      } else {
        return Left(ServerFailure(errorMessage: 'Server Failure'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }
}

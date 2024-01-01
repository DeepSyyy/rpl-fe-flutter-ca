import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, void>> signIn(
      {required UserParamsLogin userParamsLogin});
  Future<void> signUp({required UserParamsRegister userParamsRegister});
  Future<Either<Failure, void>> resetPassword({required String email});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<void> signUp({
    required UserParamsRegister userParamsRegister,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userParamsRegister.email,
        password: userParamsRegister.password,
      );
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(credential.user!.uid).set({
        'name': userParamsRegister.name,
        'email': userParamsRegister.email,
        'role': userParamsRegister.role,
        'uid': credential.user!.uid,
      });
      credential.user!.updateDisplayName(userParamsRegister.name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failure, void>> signIn({
    required UserParamsLogin userParamsLogin,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userParamsLogin.email,
        password: userParamsLogin.password,
      );

      var update = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userParamsLogin.email)
          .get();

      update.docs.forEach((element) {
        element.reference.update({'password': userParamsLogin.password});
      });

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(ServerFailure(errorMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        return Left(ServerFailure(errorMessage: 'wrong-password'));
      } else if (e.code == 'invalid-email') {
        return Left(ServerFailure(errorMessage: 'invalid-email'));
      } else {
        return Left(ServerFailure(errorMessage: 'invalid email or password'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Error'));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Error'));
    }
  }
}

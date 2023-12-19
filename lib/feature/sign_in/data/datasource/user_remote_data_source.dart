import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, void>> signIn(
      {required UserParamsLogin userParamsLogin});
  Future<void> signUp({required UserParamsRegister userParamsRegister});
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
      credential.user!.updateDisplayName(userParamsRegister.name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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

      return Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(ServerFailure(errorMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        return Left(ServerFailure(errorMessage: 'wrong-password'));
      } else if (e.code == 'invalid-email') {
        return Left(ServerFailure(errorMessage: 'invalid-email'));
      } else {
        return Left(ServerFailure(errorMessage: 'Lost Connection'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Error'));
    }
  }
}
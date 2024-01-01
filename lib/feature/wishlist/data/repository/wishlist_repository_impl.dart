import 'package:dartz/dartz.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/repository/wishlist_repository.dart';
import 'package:flutter_fe_rpl/feature/wishlist/data/datasource/wishlits_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/wishlist/data/model/course_wishlist_model.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource wishlistRemoteDataSource;
  WishlistRepositoryImpl({
    required this.wishlistRemoteDataSource,
  });
  @override
  Future<Either<Failure, bool>> addWishlist({
    required String? idUser,
    required String idCourse,
  }) async {
    try {
      final result = await wishlistRemoteDataSource.addWishlist(
        idUser: idUser!,
        idCourse: idCourse,
      );
      if (result == true) {
        return const Right(true);
      } else {
        return Left(ServerFailure(errorMessage: 'Error'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteWishlist(
      {required String idCourse, required String idUser}) async {
    try {
      final result = await wishlistRemoteDataSource.deleteWishlist(
        idCourse: idCourse,
        idUser: idUser,
      );
      if (result == true) {
        return const Right(true);
      } else {
        return Left(ServerFailure(errorMessage: 'Error'));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror'));
    }
  }

  @override
  Future<Either<Failure, List<CourseWishlistModel>>> getWishlist(
      {required String idUser}) async {
    try {
      final result = await wishlistRemoteDataSource.getWishlist(
        idUser: idUser,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror'));
    }
  }

  @override
  Future<Either<Failure, CourseWishlistModel>> getCoursesById(
      {required String idCourse}) async {
    try {
      final result = await wishlistRemoteDataSource.getCoursesById(
        idCourse: idCourse,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror wishlist'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkWishlist(
      {required String idCourse, required String idUser}) async {
    try {
      final result = await wishlistRemoteDataSource.checkWishlist(
        idCourse: idCourse,
        idUser: idUser,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'eror wishlist'));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/entity/course_wislist.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/usecase/check_wishlist.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/usecase/get_wishlist.dart';
import 'package:flutter_fe_rpl/feature/wishlist/data/datasource/wishlits_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/wishlist/data/repository/wishlist_repository_impl.dart';

class WishlistProvider extends ChangeNotifier {
  List<CourseWishlist>? wishlistId;
  Failure? failure;
  bool? isWishlist;

  WishlistProvider({this.wishlistId, this.failure});

  Future<void> addWishlist(
      {required String idCourse, required String? idUser}) async {
    WishlistRepositoryImpl repo = WishlistRepositoryImpl(
        wishlistRemoteDataSource: WishlistRemoteDataSourceImpl());
    final failureOrSuccess =
        await repo.addWishlist(idUser: idUser!, idCourse: idCourse);

    failureOrSuccess.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (voidValue) {
      isWishlist = voidValue;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> deleteWishlist(
      {required String idCourse, required String idUser}) async {
    WishlistRepositoryImpl repo = WishlistRepositoryImpl(
        wishlistRemoteDataSource: WishlistRemoteDataSourceImpl());
    final failureOrSuccess =
        await repo.deleteWishlist(idUser: idUser, idCourse: idCourse);

    failureOrSuccess.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (voidValue) {
      isWishlist = false;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> getWishlist({required String idUser}) async {
    WishlistRepositoryImpl repo = WishlistRepositoryImpl(
        wishlistRemoteDataSource: WishlistRemoteDataSourceImpl());
    final failureOrSuccess = await GetWishlist(repo).call(idUser: idUser);

    failureOrSuccess.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (wishlist) {
      wishlistId = null;
      wishlistId = wishlist;
      failure = null;
      notifyListeners();
    });
  }

  Future<void> checkWishlist(
      {required String idCourse, required String idUser}) async {
    WishlistRepositoryImpl repo = WishlistRepositoryImpl(
        wishlistRemoteDataSource: WishlistRemoteDataSourceImpl());
    final failureOrSuccess =
        await CheckWishlist(repo).call(idCourse: idCourse, idUser: idUser);

    failureOrSuccess.fold((newFailure) {
      failure = newFailure;
      notifyListeners();
    }, (voidValue) {
      isWishlist = null;
      isWishlist = voidValue;
      failure = null;
      notifyListeners();
    });
  }
}

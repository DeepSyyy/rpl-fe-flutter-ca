import 'package:dio/dio.dart';
import 'package:flutter_fe_rpl/core/const/constant.dart';
import 'package:flutter_fe_rpl/core/params/user_params.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/model/main_model/user_response_model.dart';

abstract class UserRemoteDataSource {
  Future<UserResponseModel> signIn({required UserParamsLogin userParamsLogin});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.dio});
  final Dio dio;
  @override
  Future<UserResponseModel> signIn({
    required UserParamsLogin userParamsLogin,
  }) async {
    // final response =
    // if (response.statusCode == 200) {
    //   return UserResponseModel.fromJson(response.data);
    // } else if (response.statusCode == 404) {
    //   return UserResponseModel.fromJson(response.data);
    // } else {
    //   throw Exception();
    // }

    try {
      final response = await dio.post('$baseurl/api/courze/user/login',
          data: userParamsLogin.toJson());
      if (response.statusCode == 200) {
        return UserResponseModel.fromJson(response.data);
      } else if (response.statusCode == 404) {
        return UserResponseModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }
}

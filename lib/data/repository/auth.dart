import 'package:dio/dio.dart';
import 'package:primetime/data/models/signin_req_params.dart';
import 'package:primetime/data/models/signup_req_params.dart';
import 'package:primetime/data/models/user.dart';
import 'package:primetime/data/source/auth_api_service.dart';
import 'package:primetime/data/source/auth_local_service.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:primetime/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    Either result = await sl<AuthApiService>().signup(signupReqParams);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      if (response.statusCode == 200) {
        // Save token to local storage
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response.data['token']);
        return Right(data);
      } else {
        return Left(response.data['message']);
      }
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getUserProfile() async {
    Either result = await sl<AuthApiService>().getUserProfile();
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      if (response.statusCode != 200) {
        return Left(response.data['message']);
      }
      var userModel = UserModel.fromMap(response.data);
      var userEntity = userModel.toEntity();
      return Right(userEntity);
    });
  }

  @override
  Future logout() async {
    return await sl<AuthLocalService>().logout();
  }

  @override
  Future<Either> signin(SigninReqParams signinReqParams) async {
    Either result = await sl<AuthApiService>().signin(signinReqParams);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      if (response.statusCode != 200) {
        return Left(response.data['message']);
      }
      // Save token to local storage
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.data['token']);
      return Right(response);
    });
  }
}

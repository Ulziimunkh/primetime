import 'package:dartz/dartz.dart';
import 'package:primetime/data/models/signin_req_params.dart';
import 'package:primetime/data/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams signupReqParams);
  Future<Either> signin(SigninReqParams signinReqParams);
  Future<bool> isLoggedIn();
  Future logout();
  Future<Either> getUserProfile();
}

import 'package:dartz/dartz.dart';
import 'package:day_watch/data/authentication/models/signinRequestParams.dart';
import 'package:day_watch/data/authentication/models/signupRequestParams.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupRequestParams params);
  Future<Either> signIn(SigninrequestParams params);
}

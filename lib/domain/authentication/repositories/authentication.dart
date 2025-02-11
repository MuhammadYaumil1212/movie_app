import 'package:dartz/dartz.dart';
import 'package:day_watch/data/authentication/models/authentication.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupRequestParams params);
}

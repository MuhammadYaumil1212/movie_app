import 'package:dartz/dartz.dart';
import 'package:day_watch/data/authentication/models/authentication.dart';
import 'package:day_watch/data/authentication/source/authentication_service.dart';
import 'package:day_watch/domain/authentication/repositories/authentication.dart';
import 'package:day_watch/service_locator.dart';

class AuthenticationRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupRequestParams params) async {
    // TODO: implement signUp
    return await sl<AuthenticationService>().signUp(params);
  }
}

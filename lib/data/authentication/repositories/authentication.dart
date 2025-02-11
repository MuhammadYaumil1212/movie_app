import 'package:dartz/dartz.dart';
import 'package:day_watch/data/authentication/models/authentication.dart';
import 'package:day_watch/data/authentication/source/authentication_service.dart';
import 'package:day_watch/domain/authentication/repositories/authentication.dart';

class AuthenticationRepositoryImpl extends AuthRepository {
  AuthenticationService authApiService;
  AuthenticationRepositoryImpl({required this.authApiService});
  @override
  Future<Either> signUp(SignupRequestParams params) async {
    // TODO: implement signUp
    return await authApiService.signUp(params);
  }
}

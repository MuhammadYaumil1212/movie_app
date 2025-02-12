import 'package:dartz/dartz.dart';
import 'package:day_watch/core/constants/string.dart';
import 'package:day_watch/core/helper/storage/AppStorage.dart';
import 'package:day_watch/data/authentication/models/signinRequestParams.dart';
import 'package:day_watch/data/authentication/models/signupRequestParams.dart';
import 'package:day_watch/data/authentication/source/authentication_service.dart';
import 'package:day_watch/domain/authentication/repositories/authentication.dart';
import 'package:day_watch/service_locator.dart';

class AuthenticationRepositoryImpl extends AuthRepository {
  final storage = AppStorage.instance;
  @override
  Future<Either> signUp(SignupRequestParams params) async {
    // TODO: implement signUp
    final dataSignup = await sl<AuthenticationService>().signUp(params);
    return dataSignup.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Future<Either> signIn(SigninrequestParams params) async {
    // TODO: implement signIn
    final dataSignin = await sl<AuthenticationService>().signIn(params);
    return dataSignin.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        await storage.put(AppString.TOKEN_KEY, data['user']['token']);
        return Right(data);
      },
    );
  }
}

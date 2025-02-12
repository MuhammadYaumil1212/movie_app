import 'package:dartz/dartz.dart';
import 'package:day_watch/core/usecase/usecase.dart';
import 'package:day_watch/data/authentication/models/signinRequestParams.dart';
import 'package:day_watch/domain/authentication/repositories/authentication.dart';

import '../../../service_locator.dart';

class SigninUsecase extends Usecase<Either, SigninrequestParams> {
  @override
  Future<Either> call({SigninrequestParams? params}) async {
    // TODO: implement call
    return await sl<AuthRepository>().signIn(params!);
  }
}

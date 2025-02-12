import 'package:dartz/dartz.dart';
import 'package:day_watch/core/usecase/usecase.dart';
import 'package:day_watch/data/authentication/models/authentication.dart';
import 'package:day_watch/data/authentication/repositories/authentication.dart';
import 'package:day_watch/domain/authentication/repositories/authentication.dart';

import '../../../service_locator.dart';

class SignupUsecase extends Usecase<Either, SignupRequestParams> {
  @override
  Future<Either> call({SignupRequestParams? params}) async {
    // TODO: implement call
    return await sl<AuthRepository>().signUp(params!);
  }
}

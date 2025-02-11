import 'package:dartz/dartz.dart';
import 'package:day_watch/core/constants/api_url.dart';
import 'package:day_watch/core/network/dio_client.dart';
import 'package:day_watch/data/authentication/models/authentication.dart';
import 'package:dio/dio.dart';

import '../../../service_locator.dart';

abstract class AuthenticationService {
  Future<Either> signUp(SignupRequestParams params);
}

class AuthenticationServiceImpl extends AuthenticationService {
  @override
  Future<Either> signUp(SignupRequestParams params) async {
    // TODO: implement signUp
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signUp,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Something Gone Wrong!");
    }
  }
}

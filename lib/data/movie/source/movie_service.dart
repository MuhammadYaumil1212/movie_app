import 'package:dartz/dartz.dart';
import 'package:day_watch/core/constants/api_url.dart';
import 'package:day_watch/core/network/dio_client.dart';
import 'package:day_watch/data/authentication/models/signinRequestParams.dart';
import 'package:day_watch/data/authentication/models/signupRequestParams.dart';
import 'package:dio/dio.dart';

import '../../../service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
}

class MovieServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    // TODO: implement getTrendingMovies
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Something Gone Wrong!");
    }
  }
}

import 'package:day_watch/core/helper/storage/AppStorage.dart';
import 'package:day_watch/core/network/dio_client.dart';
import 'package:day_watch/data/authentication/repositories/authentication.dart';
import 'package:day_watch/data/authentication/source/authentication_service.dart';
import 'package:day_watch/domain/authentication/repositories/authentication.dart';
import 'package:day_watch/domain/authentication/usecases/signin.dart';
import 'package:day_watch/domain/authentication/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  //services
  sl.registerSingleton<AuthenticationService>(AuthenticationServiceImpl());
  //repositories
  sl.registerSingleton<AuthRepository>(AuthenticationRepositoryImpl());
  //usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}

import 'package:bloc/bloc.dart';
import 'package:day_watch/core/helper/storage/AppStorage.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/string.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void appStarted() async {
    final storageInstance = AppStorage.instance;
    await Future.delayed(Duration(seconds: 2));
    final storage = await storageInstance.get(AppString.TOKEN_KEY);
    if (storage != null) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}

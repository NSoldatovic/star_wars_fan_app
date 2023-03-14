import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading(0));

  int loadingSpeed = 200;

  Future<void> startLoading(int loadTo) async {
    if (loadTo == 100) {
      loadingSpeed = 30;
    }
    if (state is SplashLoading) {
      int counter = (state as SplashLoading).percentage;
      while (counter < loadTo) {
        await Future.delayed(Duration(milliseconds: loadingSpeed));
        emit(SplashLoading(++counter));
      }
      if (counter >= 100) {
        emit(SplashLoaded());
      }
    }
  }
}

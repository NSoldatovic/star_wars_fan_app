import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashLoading(0));

  int loadingSpeed = 200;
  int counter = 0;

  Future<void> startLoading(int loadTo) async {
    if (loadTo == 100) {
      loadingSpeed = 30;
    }
    if (state is SplashLoading) {
      counter = (state as SplashLoading).percentage;
      while (counter < loadTo) {
        await Future.delayed(Duration(milliseconds: loadingSpeed));
        emit(SplashLoading(++counter));
      }
      await Future.delayed(const Duration(milliseconds: 100));
      if (counter >= 100) {
        emit(SplashLoaded());
        counter = 0;
      }
    }
  }
}

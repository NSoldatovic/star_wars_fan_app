import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading(0));

  Future<void> startLoading(int loadTo) async {
    if (state is SplashLoading) {
      int counter = (state as SplashLoading).percentage;
      while (counter < loadTo) {
        await Future.delayed(Duration(milliseconds: loadTo != 100 ? 200 : 30));
        emit(SplashLoading(++counter));
      }
      if (counter >= 100) {
        emit(SplashLoaded());
      }
    }
  }
}

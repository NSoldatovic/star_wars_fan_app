part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashLoading extends SplashState {

  final int percentage;

  const SplashLoading(this.percentage);
  @override
  List<Object> get props => [percentage];
}

class SplashLoaded extends SplashState{
  @override
  List<Object?> get props => [];
}
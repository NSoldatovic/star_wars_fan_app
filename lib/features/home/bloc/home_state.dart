part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoaded extends HomeState {
  final List<Resource> resources;

  const HomeLoaded(this.resources);

  @override
  List<Object> get props => [resources];
}


class HomeLoading extends HomeState {
  final int percentage;

  const HomeLoading(this.percentage);

  @override
  List<Object> get props => [percentage];
}

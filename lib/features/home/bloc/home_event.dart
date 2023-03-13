part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeFetchResources extends HomeEvent {

}
class HomeSearchValue extends HomeEvent {
  final String value;
  const HomeSearchValue(this.value);
}
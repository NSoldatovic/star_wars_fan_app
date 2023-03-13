import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/services/all_services.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeLoading(0)) {
    on<HomeFetchResources>(_onFetchResources);
    on<HomeSearchValue>(_onHomeSearchValue);
  }

  List<Resource> allResources = [];

  Future<void> _onFetchResources(
    HomeFetchResources event,
    Emitter<HomeState> emit,
  ) async {
    try {
      allResources
          .addAll(await AllServices().serverCommunicationService.getAllFilms());
      emit(const HomeLoading(15));
      allResources.addAll(
          await AllServices().serverCommunicationService.getAllStarships());
      emit(const HomeLoading(30));
      allResources.addAll(
          await AllServices().serverCommunicationService.getAllPlanets());
      emit(const HomeLoading(45));
      allResources.addAll(
          await AllServices().serverCommunicationService.getAllVehicle());
      emit(const HomeLoading(60));
      allResources.addAll(
          await AllServices().serverCommunicationService.getAllSpecies());
      emit(const HomeLoading(75));
      allResources.addAll(
          await AllServices().serverCommunicationService.getAllPeople());
      emit(const HomeLoading(100));
      await Future.delayed(const Duration(milliseconds: 50));
      emit(HomeLoaded(allResources));
    } catch (e) {
      print("HOME FETCH ERROR: $e");
    }
  }

  Future<void> _onHomeSearchValue(
    HomeSearchValue event,
    Emitter<HomeState> emit,
  ) async {
    if (event.value.isNotEmpty) {
      List<Resource> searchedList = await AllServices()
          .searchResourceService
          .searchForResource(value: event.value, allResources: allResources);
      emit(HomeLoaded(searchedList));
    } else {
      emit(HomeLoaded(allResources));
    }
  }
}

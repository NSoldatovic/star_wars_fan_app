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
    on<HomeFilterResourcesByType>(_onHomeFilterResourcesByType);
  }

  List<Resource> allResources = [];
  List<ResourceType> selectedTypes = [];

  Future<void> _onFetchResources(
    HomeFetchResources event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(const HomeLoading(1));
      allResources.addAll(await AllServices().serverCommunicationService.getAllFilms());
      emit(const HomeLoading(15));
      allResources.addAll(await AllServices().serverCommunicationService.getAllStarships());
      emit(const HomeLoading(30));
      allResources.addAll(await AllServices().serverCommunicationService.getAllPlanets());
      emit(const HomeLoading(45));
      allResources.addAll(await AllServices().serverCommunicationService.getAllVehicle());
      emit(const HomeLoading(60));
      allResources.addAll(await AllServices().serverCommunicationService.getAllSpecies());
      emit(const HomeLoading(75));
      allResources.addAll(await AllServices().serverCommunicationService.getAllPeople());
      emit(const HomeLoading(100));
      _connectResources();
      await Future.delayed(const Duration(milliseconds: 50));
      emit(HomeLoaded(allResources));
    } catch (e) {
      emit(HomeError(e.toString()));
      print("HOME FETCH ERROR: $e");
    }
  }

  Future<void> _onHomeSearchValue(
    HomeSearchValue event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeSearchLoading());
    await Future.delayed(const Duration(milliseconds: 200));
    if (event.value.isNotEmpty) {
      List<Resource> searchedList =
        await AllServices().searchResourceService.searchForResource(value: event.value, resources: filteredList);
      if (searchedList.isNotEmpty) {
        emit(HomeLoaded(searchedList));
      } else {
        emit(HomeSearchNotFound(event.value));
      }
    } else {
      emit(HomeLoaded(filteredList));
    }
  }

  Future<void> _onHomeFilterResourcesByType(
    HomeFilterResourcesByType event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeSearchLoading());
    AllServices().searchResourceService.clearTextField();
    await Future.delayed(const Duration(milliseconds: 200));
    selectedTypes = event.values;
    emit(HomeLoaded(filteredList));
  }

  List<Resource> get filteredList {
    if (selectedTypes.isNotEmpty) {
      List<Resource> filteredList = [];
      for (var type in selectedTypes) {
        for (var resource in allResources) {
          if (resource.type == type) {
            filteredList.add(resource);
          }
        }
      }
      return filteredList;
    } else {
      return allResources;
    }
  }

  _connectResources() {
    for (final resource in allResources) {
      resource.populateConnectedResources(allResources);
    }
  }
}

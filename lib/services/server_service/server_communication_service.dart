import 'dart:async';
import 'dart:convert';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/services/server_service/base_server_service.dart';

class ServerCommunicationService extends BaseServerService {

  Future<List<Resource>> getAllResources() async {
    List<Resource> list = [];
    list.addAll(await getAllPlanets());
    list.addAll(await getAllPeople());
    list.addAll(await getAllFilms());
    list.addAll(await getAllSpecies());
    list.addAll(await getAllStarships());
    list.addAll(await getAllVehicle());
    return list;
  }

  Future<List<Planet>> getAllPlanets() async {
    List<Planet> list = [];
    final response = await getRequest(BaseServerService.STAR_WARS_API_CALL_PLANETS);
    if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
      Map decodedMap = json.decode(response.body) as Map;
      List temp = decodedMap["results"] as List;
      for (final element in temp) {
        list.add(Planet.fromMap(element));
      }
      while (decodedMap["next"] != null) {
        final response = await getRequestFromUrl("${decodedMap["next"]}");
        if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
          decodedMap = json.decode(response.body) as Map;
          List temp = decodedMap["results"] as List;
          for (final element in temp) {
            list.add(Planet.fromMap(element));
          }
        } else {
          break;
        }
      }
    }
    return list;
  }

  Future<List<People>> getAllPeople() async {
    List<People> list = [];
    final response = await getRequest(BaseServerService.STAR_WARS_API_CALL_PEOPLE);
    if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
      Map decodedMap = json.decode(response.body) as Map;
      List temp = decodedMap["results"] as List;
      for (final element in temp) {
        list.add(People.fromMap(element));
      }
      while (decodedMap["next"] != null) {
        final response = await getRequestFromUrl("${decodedMap["next"]}");
        if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
          decodedMap = json.decode(response.body) as Map;
          List temp = decodedMap["results"] as List;
          for (final element in temp) {
            list.add(People.fromMap(element));
          }
        } else {
          break;
        }
      }
    }
    return list;
  }

  Future<List<Film>> getAllFilms() async {
    List<Film> list = [];
    final response = await getRequest(BaseServerService.STAR_WARS_API_CALL_FILMS);
    if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
      Map decodedMap = json.decode(response.body) as Map;
      List temp = decodedMap["results"] as List;
      for (final element in temp) {
        list.add(Film.fromMap(element));
      }
      while (decodedMap["next"] != null) {
        final response = await getRequestFromUrl("${decodedMap["next"]}");
        if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
          decodedMap = json.decode(response.body) as Map;
          List temp = decodedMap["results"] as List;
          for (final element in temp) {
            list.add(Film.fromMap(element));
          }
        } else {
          break;
        }
      }
    }
    return list;
  }

  Future<List<Specie>> getAllSpecies() async {
    List<Specie> list = [];
    final response = await getRequest(BaseServerService.STAR_WARS_API_CALL_SPECIES);
    if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
      Map decodedMap = json.decode(response.body) as Map;
      List temp = decodedMap["results"] as List;
      for (final element in temp) {
        list.add(Specie.fromMap(element));
      }
      while (decodedMap["next"] != null) {
        final response = await getRequestFromUrl("${decodedMap["next"]}");
        if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
          decodedMap = json.decode(response.body) as Map;
          List temp = decodedMap["results"] as List;
          for (final element in temp) {
            list.add(Specie.fromMap(element));
          }
        } else {
          break;
        }
      }
    }
    return list;
  }

  Future<List<Starship>> getAllStarships() async {
    List<Starship> list = [];
    final response = await getRequest(BaseServerService.STAR_WARS_API_CALL_STARSHIPS);
    if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
      Map decodedMap = json.decode(response.body) as Map;
      List temp = decodedMap["results"] as List;
      for (final element in temp) {
        list.add(Starship.fromMap(element));
      }
      while (decodedMap["next"] != null) {
        final response = await getRequestFromUrl("${decodedMap["next"]}");
        if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
          decodedMap = json.decode(response.body) as Map;
          List temp = decodedMap["results"] as List;
          for (final element in temp) {
            list.add(Starship.fromMap(element));
          }
        } else {
          break;
        }
      }
    }
    return list;
  }

  Future<List<Vehicle>> getAllVehicle() async {
    List<Vehicle> list = [];
    final response = await getRequest(BaseServerService.STAR_WARS_API_CALL_VEHICLES);
    if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
      Map decodedMap = json.decode(response.body) as Map;
      List temp = decodedMap["results"] as List;
      for (final element in temp) {
        list.add(Vehicle.fromMap(element));
      }
      while (decodedMap["next"] != null) {
        final response = await getRequestFromUrl("${decodedMap["next"]}");
        if(response.statusCode == BaseServerService.STATUS_CODE_OK_200) {
          decodedMap = json.decode(response.body) as Map;
          List temp = decodedMap["results"] as List;
          for (final element in temp) {
            list.add(Vehicle.fromMap(element));
          }
        } else {
          break;
        }
      }
    }
    return list;
  }
}

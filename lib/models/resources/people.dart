import 'package:star_wars_fan_app/models/models.dart';

class People extends Resource {

  final String birthYear;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String mass;
  final String skinColor;

  final Map<String, List<String>> connectedResourcesUrls = {};
  final List<Film> films = [];
  final List<Specie> species = [];
  final List<Planet> homeworld = [];
  final List<Starship> starships = [];
  final List<Vehicle> vehicles = [];

  People({
    required this.birthYear,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.mass,
    required this.skinColor,
    required super.name,
    required super.url,
    super.type = ResourceType.people
  });

  factory People.fromMap(Map<String, dynamic> map) {
    final people = People(
      birthYear: map['birth_year'] as String,
      eyeColor: map['eye_color'] as String,
      gender: map['gender'] as String,
      hairColor: map['hair_color'] as String,
      height: map['height'] as String,
      mass: map['mass'] as String,
      skinColor: map['skin_color'] as String,
      name: map['name'] as String,
      url: map['url'] as String,
    );
    people.connectedResourcesUrls.addAll({
      'films': List<String>.from(map['films'].map((e) => e.toString())),
      'species': List<String>.from(map['species'].map((e) => e.toString())),
      'starships': List<String>.from(map['starships'].map((e) => e.toString())),
      'homeworld': [map['homeworld'] as String],
      'vehicles': List<String>.from(map['vehicles'].map((e) => e.toString())),
    });
    return people;
  }

  void populateConnectedResources(List<Resource> allResources) {
    for (final url in connectedResourcesUrls['films'] ?? []) {
      films.add(allResources.firstWhere((resource) => resource.url == url) as Film);
    }
    for (final url in connectedResourcesUrls['species'] ?? []) {
      species.add(allResources.firstWhere((resource) => resource.url == url) as Specie);
    }
    for (final url in connectedResourcesUrls['starships'] ?? []) {
      starships.add(allResources.firstWhere((resource) => resource.url == url) as Starship);
    }
    for (final url in connectedResourcesUrls['vehicles'] ?? []) {
      vehicles.add(allResources.firstWhere((resource) => resource.url == url) as Vehicle);
    }
    for (final url in connectedResourcesUrls['homeworld'] ?? []) {
      homeworld.add(allResources.firstWhere((resource) => resource.url == url) as Planet);
    }
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), gender];
}
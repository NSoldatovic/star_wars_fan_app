import 'package:star_wars_fan_app/models/models.dart';

class Planet extends Resource {
  final String diameter;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String gravity;
  final String population;
  final String climate;
  final String terrain;

  final Map<String, List<String>> connectedResourcesUrls = {};
  final List<People> residents = [];
  final List<Film> films = [];

  Planet({
    required this.diameter,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.gravity,
    required this.population,
    required this.climate,
    required this.terrain,
    required String name,
    required String url,
  }) : super(name: name, url: url, type: ResourceType.planets);

  factory Planet.fromMap(Map<String, dynamic> map) {
    final planet = Planet(
      diameter: map['diameter'] as String,
      rotationPeriod: map['rotation_period'] as String,
      orbitalPeriod: map['orbital_period'] as String,
      gravity: map['gravity'] as String,
      population: map['population'] as String,
      climate: map['climate'] as String,
      terrain: map['terrain'] as String,
      name: map['name'] as String,
      url: map['url'] as String,
    );
    planet.connectedResourcesUrls.addAll({
      'residents': List<String>.from(map['residents'].map((e) => e.toString())),
      'films': List<String>.from(map['films'].map((e) => e.toString())),
    });
    return planet;
  }

  @override
  void populateConnectedResources(List<Resource> allResources) {
    for (final url in connectedResourcesUrls['residents'] ?? []) {
      residents.add(allResources.firstWhere((resource) => resource.url == url) as People);
    }
    for (final url in connectedResourcesUrls['films'] ?? []) {
      films.add(allResources.firstWhere((resource) => resource.url == url) as Film);
    }
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), terrain];
}

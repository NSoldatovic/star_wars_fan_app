import 'resource.dart';

class Planet extends Resource {
  final String diameter;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String gravity;
  final String population;
  final String climate;
  final String terrain;
  final List<String> residents;
  final List<String> films;

  const Planet({
    required this.diameter,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.gravity,
    required this.population,
    required this.climate,
    required this.terrain,
    required this.residents,
    required this.films,
    required String name,
    required String url,
  }) : super(name: name, url: url, type: ResourceType.planets);

  factory Planet.fromMap(Map<String, dynamic> map) {
    return Planet(
      diameter: map['diameter'] as String,
      rotationPeriod: map['rotation_period'] as String,
      orbitalPeriod: map['orbital_period'] as String,
      gravity: map['gravity'] as String,
      population: map['population'] as String,
      climate: map['climate'] as String,
      terrain: map['terrain'] as String,
      residents: List<String>.from(map['residents'].map((e) => e.toString())),
      films: List<String>.from(map['films'].map((e) => e.toString())),
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), terrain];
}

import 'package:star_wars_fan_app/models/models.dart';

import 'resource.dart';

class Specie extends Resource {

  final String averageHeight;
  final String averageLifespan;
  final String classification;
  final String designation;
  final String eyeColors;
  final String hairColors;
  final String language;
  final String skinColors;

  final Map<String, List<String>> connectedResourcesUrls = {};
  final List<Planet> homeworld = [];
  final List<People> people = [];
  final List<Film> films = [];

  Specie({
    required this.averageHeight,
    required this.averageLifespan,
    required this.classification,
    required this.designation,
    required this.eyeColors,
    required this.hairColors,
    required this.language,
    required this.skinColors,
    required String name,
    required String url,
    ResourceType type = ResourceType.species,
  }) : super(name: name, url: url, type: type);

  factory Specie.fromMap(Map<String, dynamic> map) {
    final specie = Specie(
      averageHeight: map['average_height'] as String,
      averageLifespan: map['average_lifespan'] as String,
      classification: map['classification'] as String,
      designation: map['designation'] as String,
      eyeColors: map['eye_colors'] as String,
      hairColors: map['hair_colors'] as String,
      language: map['language'] as String,
      skinColors: map['skin_colors'] as String,
      name: map['name'] as String,
      url: map['url'] as String,
    );
    specie.connectedResourcesUrls.addAll({
      if (map['homeworld'] != null) 'homeworld': [map['homeworld'] as String],
      'people': List<String>.from(map['people'].map((e) => e.toString())),
      'films': List<String>.from(map['films'].map((e) => e.toString())),
    });
    return specie;
  }
  // aleeena

  @override
  void populateConnectedResources(List<Resource> allResources) {
    for (final url in connectedResourcesUrls['people'] ?? []) {
      people.add(allResources.firstWhere((resource) => resource.url == url) as People);
    }
    for (final url in connectedResourcesUrls['films'] ?? []) {
      films.add(allResources.firstWhere((resource) => resource.url == url) as Film);
    }
    for (final url in connectedResourcesUrls['homeworld'] ?? []) {
      homeworld.add(allResources.firstWhere((resource) => resource.url == url) as Planet);
    }
  }
}

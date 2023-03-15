import 'package:star_wars_fan_app/models/models.dart';

class Film extends Resource {
  final String director;
  final String episodeId;
  final String openingCrawl;
  final String producer;
  final String releaseDate;

  final Map<String, List<String>> connectedResourcesUrls = {};
  final List<People> characters = [];
  final List<Planet> planets = [];
  final List<Specie> species = [];
  final List<Starship> starships = [];
  final List<Vehicle> vehicles = [];

  Film({
    required this.director,
    required this.episodeId,
    required this.openingCrawl,
    required this.producer,
    required this.releaseDate,
    required String name,
    required String url,
  }) : super(name: name, url: url, type: ResourceType.films);

  factory Film.fromMap(Map<String, dynamic> map) {
    final newFilm = Film(
      director: map['director'] as String,
      episodeId: map['episode_id'].toString(),
      openingCrawl: map['opening_crawl'] as String,
      producer: map['producer'] as String,
      releaseDate: map['release_date'] as String,
      name: map['title'] as String,
      url: map['url'] as String,
    );
    newFilm.connectedResourcesUrls.addAll({
      'characters': List<String>.from(map['characters'].map((e) => e.toString())),
      'planets': List<String>.from(map['planets'].map((e) => e.toString())),
      'species': List<String>.from(map['species'].map((e) => e.toString())),
      'starships': List<String>.from(map['starships'].map((e) => e.toString())),
      'vehicles': List<String>.from(map['vehicles'].map((e) => e.toString())),
    });
    return newFilm;
  }

  @override
  void populateConnectedResources(List<Resource> allResources) {
    for (final url in connectedResourcesUrls['characters'] ?? []) {
      characters.add(allResources.firstWhere((resource) => resource.url == url) as People);
    }
    for (final url in connectedResourcesUrls['planets'] ?? []) {
      planets.add(allResources.firstWhere((resource) => resource.url == url) as Planet);
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
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), director, releaseDate];
}

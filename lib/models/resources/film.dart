import 'resource.dart';

class Film extends Resource {
  final String director;
  final String episodeId;
  final String openingCrawl;
  final String producer;
  final String releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> species;
  final List<String> starships;
  final List<String> vehicles;

  const Film({
    required this.director,
    required this.episodeId,
    required this.openingCrawl,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.species,
    required this.starships,
    required this.vehicles,
    required String name,
    required String url,
  }) : super(name: name, url: url, type: ResourceType.films);

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      director: map['director'] as String,
      episodeId: map['episode_id'].toString(),
      openingCrawl: map['opening_crawl'] as String,
      producer: map['producer'] as String,
      releaseDate: map['release_date'] as String,
      characters: List<String>.from(map['characters'].map((e) => e.toString())),
      planets: List<String>.from(map['planets'].map((e) => e.toString())),
      species: List<String>.from(map['species'].map((e) => e.toString())),
      starships: List<String>.from(map['starships'].map((e) => e.toString())),
      vehicles: List<String>.from(map['vehicles'].map((e) => e.toString())),
      name: map['title'] as String,
      url: map['url'] as String,
    );
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), director, releaseDate];
}

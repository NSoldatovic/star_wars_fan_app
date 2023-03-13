import 'resource.dart';

class Specie extends Resource {

  final String averageHeight;
  final String averageLifespan;
  final String classification;
  final String designation;
  final String eyeColors;
  final String hairColors;
  final String homeworld;
  final String language;
  final String skinColors;
  final List<String> people;
  final List<String> films;

  const Specie({
    required this.averageHeight,
    required this.averageLifespan,
    required this.classification,
    required this.designation,
    required this.eyeColors,
    required this.hairColors,
    required this.homeworld,
    required this.language,
    required this.skinColors,
    required this.people,
    required this.films,
    required String name,
    required String url,
    ResourceType type = ResourceType.species,
  }) : super(name: name, url: url, type: type);

  factory Specie.fromMap(Map<String, dynamic> map) {
    return Specie(
      averageHeight: map['average_height'] as String,
      averageLifespan: map['average_lifespan'] as String,
      classification: map['classification'] as String,
      designation: map['designation'] as String,
      eyeColors: map['eye_colors'] as String,
      hairColors: map['hair_colors'] as String,
      homeworld: (map['homeworld'] as String?) ?? "",
      language: map['language'] as String,
      skinColors: map['skin_colors'] as String,
      people: List<String>.from(map['people'].map((e) => e.toString())),
      films: List<String>.from(map['films'].map((e) => e.toString())),
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}

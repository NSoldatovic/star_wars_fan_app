import 'package:star_wars_fan_app/models/models.dart';

class People extends Resource {

  final String birthYear;
  final String eyeColor;
  final String gender;
  final String hairColor;
  final String height;
  final String mass;
  final String skinColor;
  final List<String> films;
  final List<String> species;
  final List<String> homeworld;
  final List<String> starships;
  final List<String> vehicles;

  const People({
    required this.birthYear,
    required this.eyeColor,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.mass,
    required this.skinColor,
    required this.films,
    required this.species,
    required this.homeworld,
    required this.starships,
    required this.vehicles,
    required super.name,
    required super.url,
    super.type = ResourceType.people
  });

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      birthYear: map['birth_year'] as String,
      eyeColor: map['eye_color'] as String,
      gender: map['gender'] as String,
      hairColor: map['hair_color'] as String,
      height: map['height'] as String,
      mass: map['mass'] as String,
      skinColor: map['skin_color'] as String,
      films: List<String>.from(map['films'].map((e) => e.toString())),
      species: List<String>.from(map['species'].map((e) => e.toString())),
      starships: List<String>.from(map['starships'].map((e) => e.toString())),
      homeworld: [map['homeworld'] as String],
      vehicles: List<String>.from(map['vehicles'].map((e) => e.toString())),
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}
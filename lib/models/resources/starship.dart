import 'resource.dart';

class Starship extends Resource {
  final String model;
  final String starshipClass;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String crew;
  final String passengers;
  final String maxAtmospheringSpeed;
  final String hyperdriveRating;
  final String mglt;
  final String cargoCapacity;
  final String consumables;
  final List<String> pilots;
  final List<String> films;

  const Starship({
    required this.model,
    required this.starshipClass,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.crew,
    required this.passengers,
    required this.maxAtmospheringSpeed,
    required this.hyperdriveRating,
    required this.mglt,
    required this.cargoCapacity,
    required this.consumables,
    required this.pilots,
    required this.films,
    required super.name,
    required super.url,
  }) : super(type: ResourceType.starships);

  factory Starship.fromMap(Map<String, dynamic> map) {
    return Starship(
      name: map['name'] as String,
      url: map['url'] as String,
      model: map['model'] as String,
      starshipClass: map['starship_class'] as String,
      manufacturer: map['manufacturer'] as String,
      costInCredits: map['cost_in_credits'] as String,
      length: map['length'] as String,
      crew: map['crew'] as String,
      passengers: map['passengers'] as String,
      maxAtmospheringSpeed: map['max_atmosphering_speed'] as String,
      hyperdriveRating: map['hyperdrive_rating'] as String,
      mglt: map['MGLT'] as String,
      cargoCapacity: map['cargo_capacity'] as String,
      consumables: map['consumables'] as String,
      pilots: List<String>.from(map['pilots'].map((e) => e.toString())),
      films: List<String>.from(map['films'].map((e) => e.toString())),
    );
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), model, starshipClass, manufacturer];
}

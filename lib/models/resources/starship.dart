import 'package:star_wars_fan_app/models/models.dart';

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

  final Map<String, List<String>> connectedResourcesUrls = {};
  final List<People> pilots = [];
  final List<Film> films = [];

  Starship({
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
    required super.name,
    required super.url,
  }) : super(type: ResourceType.starships);

  factory Starship.fromMap(Map<String, dynamic> map) {
    final starship = Starship(
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
    );
    starship.connectedResourcesUrls.addAll({
      'pilots': List<String>.from(map['pilots'].map((e) => e.toString())),
      'films': List<String>.from(map['films'].map((e) => e.toString())),
    });
    return starship;
  }

  @override
  void populateConnectedResources(List<Resource> allResources) {
    for (final url in connectedResourcesUrls['pilots'] ?? []) {
      pilots.add(allResources.firstWhere((resource) => resource.url == url) as People);
    }
    for (final url in connectedResourcesUrls['films'] ?? []) {
      films.add(allResources.firstWhere((resource) => resource.url == url) as Film);
    }
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), model, starshipClass, manufacturer];
}

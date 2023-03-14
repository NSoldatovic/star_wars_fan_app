import 'resource.dart';

class Vehicle extends Resource {
  final String cargoCapacity;
  final String consumables;
  final String costInCredits;
  final String crew;
  final String length;
  final String manufacturer;
  final String maxAtmospheringSpeed;
  final String model;
  final String passengers;
  final String vehicleClass;

  const Vehicle({
    required this.cargoCapacity,
    required this.consumables,
    required this.costInCredits,
    required this.crew,
    required this.length,
    required this.manufacturer,
    required this.maxAtmospheringSpeed,
    required this.model,
    required this.passengers,
    required this.vehicleClass,
    required String name,
    required String url,
  }) : super(name: name, url: url, type: ResourceType.vehicles);

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      cargoCapacity: map['cargo_capacity'] as String,
      consumables: map['consumables'] as String,
      costInCredits: map['cost_in_credits'] as String,
      crew: map['crew'] as String,
      length: map['length'] as String,
      manufacturer: map['manufacturer'] as String,
      maxAtmospheringSpeed: map['max_atmosphering_speed'] as String,
      model: map['model'] as String,
      passengers: map['passengers'] as String,
      vehicleClass: map['vehicle_class'] as String,
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  @override
  List<String> get searchableStrings => [name, type.toString(), model, vehicleClass];
}

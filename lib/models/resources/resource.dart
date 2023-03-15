import 'package:equatable/equatable.dart';

enum ResourceType {
  people,
  films,
  starships,
  vehicles,
  species,
  planets;

  @override
  String toString() {
    switch (this) {
      case ResourceType.people:
        return "people";
      case ResourceType.films:
        return "films";
      case ResourceType.starships:
        return "starships";
      case ResourceType.vehicles:
        return "vehicles";
      case ResourceType.species:
        return "species";
      case ResourceType.planets:
        return "planets";
      default:
        return "";
    }
  }

  static ResourceType getResourceTypeFromString(String value) {
    switch (value.toLowerCase()) {
      case "people":
        return ResourceType.people;
      case "films":
        return ResourceType.films;
      case "starships":
        return ResourceType.starships;
      case "vehicles":
        return ResourceType.vehicles;
      case "species":
        return ResourceType.species;
      case "planets":
        return ResourceType.planets;
      default:
        throw Exception("Unknown resource type: $value");
    }
  }

  static ResourceType fromUrl(String url) {
    String type = url.split("api/")[1].split("/")[0];
    return getResourceTypeFromString(type);
  }
}

class Resource extends Equatable {
  final String name;
  final String url;
  final ResourceType type;

  const Resource({
    required this.name,
    required this.url,
    required this.type,
  });

  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      name: map['name'] ?? map['title'] as String,
      url: map['url'] as String,
      type: ResourceType.fromUrl(map['url'] as String),
    );
  }

  @override
  String toString() {
    return 'Resource{name: $name, url: $url, type: $type}';
  }

  void populateConnectedResources(List<Resource> allResources) {}

  @override
  List<Object?> get props => [name, url, type];

  List<String> get searchableStrings => [name, type.toString()];
}

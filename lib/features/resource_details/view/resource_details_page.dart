import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/app_spacing.dart';
import 'package:star_wars_fan_app/ui_consts/star_wars_scaffold.dart';

class ResourceDetailsPage extends StatelessWidget {
  final Resource resource;

  const ResourceDetailsPage({Key? key, required this.resource})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StarWarsScaffold(
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              width: double.infinity,
              color: Colors.blue,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new))
                ],
              ),
            ),
            (() {
              switch (resource.type) {
                case ResourceType.people:
                  return PeopleDetails(people: resource as People);
                case ResourceType.vehicles:
                  return VehicleDetails(vehicle: resource as Vehicle);
                case ResourceType.films:
                  return FilmDetails(film: resource as Film);
                case ResourceType.starships:
                  return StarshipDetails(starship: resource as Starship);
                case ResourceType.species:
                  return SpecieDetails(specie: resource as Specie);
                case ResourceType.planets:
                  return PlanetDetails(planet: resource as Planet);
              }
            })(),
          ],
        ),
      ),
    );
  }
}

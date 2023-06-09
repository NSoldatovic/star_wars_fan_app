import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/utils/utils.dart';

class ResourceDetailsPage extends StatelessWidget {
  final Resource resource;

  const ResourceDetailsPage({Key? key, required this.resource})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StarWarsScaffold(
      child: Column(
        children: [
          Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)
            ),
            const SizedBox(
              width: AppSpacing.sm,
            ),
            Text(
              "${resource.type.toFrontendString()} " "${context.translate("details_page_title")}",
              style: Theme.of(context).boldText.copyWith(fontSize: 22),
            ),
            ],
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          Container(
            color: Theme.of(context).getColorByType(resource.type),
            height: 4,
            width: double.infinity,
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
    );
  }
}

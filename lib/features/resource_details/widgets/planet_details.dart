import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class PlanetDetails extends StatelessWidget {

  final Planet planet;
  const PlanetDetails({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Details(
                title: "Name",
                value: planet.name,
                type: planet.type,
              ),
              Details(
                title: "Rotation Period",
                value: planet.rotationPeriod,
                type: planet.type,
              ),
              Details(
                title: "Orbital Period",
                value: planet.orbitalPeriod,
                type: planet.type,
              ),
              Details(
                title: "Gravity",
                value: planet.gravity,
                type: planet.type,
              ),
              Details(
                title: "Population",
                value: planet.population,
                type: planet.type,
              ),
              Details(
                title: "Climate",
                value: planet.climate,
                type: planet.type,
              ),
              Details(
                title: "Terrain",
                value: planet.terrain,
                type: planet.type,
              ),
              OtherResourceDetails(
                title: "Residents",
                resources: planet.residents,
                parentResource: planet,
              ),
              OtherResourceDetails(
                title: "Films",
                resources: planet.films,
                parentResource: planet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


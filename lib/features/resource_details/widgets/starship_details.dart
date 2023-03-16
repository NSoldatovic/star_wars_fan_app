import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class StarshipDetails extends StatelessWidget {

  final Starship starship;
  const StarshipDetails({Key? key, required this.starship}) : super(key: key);

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
                value: starship.name,
                type: starship.type,
              ),
              Details(
                title: "Model",
                value: starship.model,
                type: starship.type,
              ),
              Details(
                title: "Starship Class",
                value: starship.starshipClass,
                type: starship.type,
              ),
              Details(
                title: "Manufacturer",
                value: starship.manufacturer,
                type: starship.type,
              ),
              Details(
                title: "Cost In Credits",
                value: starship.costInCredits,
                type: starship.type,
              ),
              Details(
                title: "Length",
                value: starship.length,
                type: starship.type,
              ),
              Details(
                title: "Crew",
                value: starship.crew,
                type: starship.type,
              ),
              Details(
                title: "Passengers",
                value: starship.passengers,
                type: starship.type,
              ),
              Details(
                title: "Max Atmosphering Speed",
                value: starship.maxAtmospheringSpeed,
                type: starship.type,
              ),
              Details(
                title: "Hyperdrive Rating",
                value: starship.hyperdriveRating,
                type: starship.type,
              ),
              Details(
                title: "MGLT",
                value: starship.mglt,
                type: starship.type,
              ),
              Details(
                title: "Cargo Capacity",
                value: starship.cargoCapacity,
                type: starship.type,
              ),
              Details(
                title: "Consumables",
                value: starship.consumables,
                type: starship.type,
              ),
              OtherResourceDetails(
                title: "Pilots",
                resources: starship.pilots,
                parentResource: starship,
              ),
              OtherResourceDetails(
                title: "Films",
                resources: starship.films,
                parentResource: starship,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

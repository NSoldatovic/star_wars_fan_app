import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/utils/utils.dart';

class PeopleDetails extends StatelessWidget {

  final People people;
  const PeopleDetails({Key? key, required this.people}) : super(key: key);

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
                value: people.name,
                type: people.type,
              ),
              Details(
                title: "Eye Color",
                value: people.eyeColor,
                type: people.type,
              ),
              Details(
                title: "Gender",
                value: people.gender,
                type: people.type,
              ),
              Details(
                title: "Hair Color",
                value: people.hairColor,
                type: people.type,
              ),
              Details(
                title: "Height",
                value: people.height,
                type: people.type,
              ),
              Details(
                title: "Mass",
                value: people.mass,
                type: people.type,
              ),
              Details(
                title: "SkinColor",
                value: people.skinColor,
                type: people.type,
              ),
              OtherResourceDetails(
                title: "Films",
                resources: people.films,
                parentResource: people,
              ),
              OtherResourceDetails(
                title: "Species",
                resources: people.species,
                parentResource: people,
              ),
              OtherResourceDetails(
                title: "Homeworld",
                resources: people.homeworld,
                parentResource: people,
              ),
              OtherResourceDetails(
                title: "Starships",
                resources: people.starships,
                parentResource: people,
              ),
              OtherResourceDetails(
                title: "Vehicles",
                resources: people.vehicles,
                parentResource: people,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

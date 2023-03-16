import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class SpecieDetails extends StatelessWidget {

  final Specie specie;
  const SpecieDetails({Key? key, required this.specie}) : super(key: key);

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
                value: specie.name,
                type: specie.type,
              ),
              Details(
                title: "Average Height",
                value: specie.averageHeight,
                type: specie.type,
              ),
              Details(
                title: "Average Lifespan",
                value: specie.averageLifespan,
                type: specie.type,
              ),
              Details(
                title: "Classification",
                value: specie.classification,
                type: specie.type,
              ),
              Details(
                title: "Designation",
                value: specie.designation,
                type: specie.type,
              ),
              Details(
                title: "Eye Colors",
                value: specie.eyeColors,
                type: specie.type,
              ),
              Details(
                title: "Hair Colors",
                value: specie.hairColors,
                type: specie.type,
              ),
              Details(
                title: "Language",
                value: specie.language,
                type: specie.type,
              ),
              Details(
                title: "Skin Colors",
                value: specie.skinColors,
                type: specie.type,
              ),
              OtherResourceDetails(
                title: "Homeworld",
                resources: specie.homeworld,
                parentResource: specie,
              ),
              OtherResourceDetails(
                title: "People",
                resources: specie.people,
                parentResource: specie,
              ),
              OtherResourceDetails(
                title: "Films",
                resources: specie.films,
                parentResource: specie,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

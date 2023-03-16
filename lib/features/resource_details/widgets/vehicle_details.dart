import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class VehicleDetails extends StatelessWidget {

  final Vehicle vehicle;
  const VehicleDetails({Key? key, required this.vehicle}) : super(key: key);

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
                value: vehicle.name,
                type: vehicle.type,
              ),
              Details(
                title: "Cargo Capacity",
                value: vehicle.cargoCapacity,
                type: vehicle.type,
              ),
              Details(
                title: "Consumables",
                value: vehicle.consumables,
                type: vehicle.type,
              ),
              Details(
                title: "Cost In Credits",
                value: vehicle.costInCredits,
                type: vehicle.type,
              ),
              Details(
                title: "Crew",
                value: vehicle.crew,
                type: vehicle.type,
              ),
              Details(
                title: "Length",
                value: vehicle.length,
                type: vehicle.type,
              ),
              Details(
                title: "Manufacturer",
                value: vehicle.manufacturer,
                type: vehicle.type,
              ),
              Details(
                title: "Max Atmosphering Speed",
                value: vehicle.maxAtmospheringSpeed,
                type: vehicle.type,
              ),
              Details(
                title: "Model",
                value: vehicle.model,
                type: vehicle.type,
              ),
              Details(
                title: "Passengers",
                value: vehicle.passengers,
                type: vehicle.type,
              ),
              Details(
                title: "Vehicle Class",
                value: vehicle.vehicleClass,
                type: vehicle.type,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

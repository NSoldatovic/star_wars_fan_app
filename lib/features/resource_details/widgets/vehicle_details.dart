import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/models/models.dart';

class VehicleDetails extends StatelessWidget {

  final Vehicle vehicle;
  const VehicleDetails({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(vehicle.name),
        ],
      ),
    );
  }
}

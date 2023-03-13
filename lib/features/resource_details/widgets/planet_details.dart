import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/models/models.dart';

class PlanetDetails extends StatelessWidget {

  final Planet planet;
  const PlanetDetails({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(planet.name),
        ],
      ),
    );
  }
}


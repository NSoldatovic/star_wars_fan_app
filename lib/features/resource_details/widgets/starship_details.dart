import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/models/models.dart';

class StarshipDetails extends StatelessWidget {

  final Starship starship;
  const StarshipDetails({Key? key, required this.starship}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(starship.name),
        ],
      ),
    );
  }
}

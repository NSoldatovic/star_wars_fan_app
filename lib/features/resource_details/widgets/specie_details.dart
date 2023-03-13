import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/models/models.dart';

class SpecieDetails extends StatelessWidget {

  final Specie specie;
  const SpecieDetails({Key? key, required this.specie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(specie.name),
        ],
      ),
    );
  }
}

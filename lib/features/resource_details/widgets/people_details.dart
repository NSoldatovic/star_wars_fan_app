import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/models/models.dart';

class PeopleDetails extends StatelessWidget {

  final People people;
  const PeopleDetails({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(people.name),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/models/models.dart';

class FilmDetails extends StatelessWidget {

  final Film film;
  const FilmDetails({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(film.name),
        ],
      ),
    );
  }
}

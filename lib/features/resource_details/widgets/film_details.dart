import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/resource_details/widgets/widgets.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class FilmDetails extends StatelessWidget {

  final Film film;
  const FilmDetails({Key? key, required this.film}) : super(key: key);

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
                title: "Title",
                value: film.name,
                type: film.type,
              ),
              Details(
                title: "Director",
                value: film.director,
                type: film.type,
              ),
              Details(
                title: "Episode ID",
                value: film.episodeId,
                type: film.type,
              ),
              Details(
                title: "Producer",
                value: film.producer,
                type: film.type,
              ),
              Details(
                title: "Opening Crawl",
                value: film.openingCrawl,
                type: film.type,
              ),
              OtherResourceDetails(
                title: "Characters",
                resources: film.characters,
                parentResource: film,
              ),
              OtherResourceDetails(
                title: "Planets",
                resources: film.planets,
                parentResource: film,
              ),
              OtherResourceDetails(
                title: "Species",
                resources: film.species,
                parentResource: film,
              ),
              OtherResourceDetails(
                title: "Starships",
                resources: film.starships,
                parentResource: film,
              ),
              OtherResourceDetails(
                title: "Vehicles",
                resources: film.vehicles,
                parentResource: film,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

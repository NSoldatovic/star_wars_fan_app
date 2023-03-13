import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/router.dart';

class HomeResourceList extends StatelessWidget {

  final List<Resource> resources;

  const HomeResourceList({
    required this.resources,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.goNamed(MyRouter.resourceDetailsPageName, extra: resources[index]);
            },
            child: Row (
              children: [
                Text(resources[index].name+ "   "),
                Text(resources[index].type.toString()),
              ],
            ),
          );
        }
      ),
    );
  }
}

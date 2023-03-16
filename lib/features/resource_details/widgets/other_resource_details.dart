import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/home/widgets/home_resource_list_card.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/utils/utils.dart';

class OtherResourceDetails extends StatelessWidget {
  final List<Resource> resources;
  final Resource parentResource;
  final String title;

  const OtherResourceDetails({
    Key? key,
    required this.resources,
    required this.parentResource,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (resources.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).getColorByType(parentResource.type).withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.standard),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).getColorByType(parentResource.type),
                  width: 2,
                ),
              ),
            ),
            child: Text(
              "$title:",
              style: Theme.of(context).normalText.copyWith(fontSize: 18),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              physics: resources.length > 1 ? null : const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: resources.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HomeResourceListCard(resource: resources[index]);
              }
            ),
          ),
        ],
      ),
    );
  }
}

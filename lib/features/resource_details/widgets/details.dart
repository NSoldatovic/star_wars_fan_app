import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class Details extends StatelessWidget {

  final String title;
  final String value;
  final ResourceType type;

  const Details({
    Key? key,
    required this.title,
    required this.value,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).getColorByType(type).withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.standard),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).getColorByType(type),
                  width: 2,
                ),
              ),
            ),
            child: Text(
              "$title:",
              style: Theme.of(context).normalText.copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: AppSpacing.xs,
          ),
          Flexible(
            child: Text(
              value,
              style: Theme.of(context).boldText.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

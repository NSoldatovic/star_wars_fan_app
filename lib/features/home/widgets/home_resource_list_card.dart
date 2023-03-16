import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/router.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class HomeResourceListCard extends StatelessWidget {
  const HomeResourceListCard({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    double colorOpacity = Theme.of(context).isLightTheme ? 1 : 0.5;
    return GestureDetector(
      onTap: () {
        context.goNamed(MyRouter.resourceDetailsPageName, extra: resource);
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(top: AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 4,
                  height: 70,
                  color: Theme.of(context).getColorByType(resource.type).withOpacity(colorOpacity),
                  margin: const EdgeInsets.only(right: AppSpacing.lg),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(resource.name,
                                    style: Theme.of(context).boldText.copyWith(
                                          fontSize: 24,
                                      overflow: TextOverflow.ellipsis
                                        )),
                              ),
                              Text(resource.type.toFrontendString(),
                                  style: Theme.of(context).normalText),
                            ],
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.all(AppSpacing.sm),
                            child: Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).getColorByType(resource.type).withOpacity(colorOpacity), width: 2))),
            ),
          ],
        ),
      ),
    );
  }
}

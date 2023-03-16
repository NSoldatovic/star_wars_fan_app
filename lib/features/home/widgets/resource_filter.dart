import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/widgets/my_check_box.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/utils/utils.dart';

class ResourceFilter {
  static show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _FilterWidget();
      },
    );
  }
}

class _FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<_FilterWidget> {
  late List<ResourceType> selectedTypes;

  @override
  void initState() {
    super.initState();
    selectedTypes = context.read<HomeBloc>().selectedTypes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom == 0
            ? AppSpacing.lg
            : MediaQuery.of(context).padding.bottom,
        left: AppSpacing.sm,
        right: AppSpacing.sm,
      ),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.md,
              top: AppSpacing.md,
              right: AppSpacing.md,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm + 3),
                  child: Text("Select type |||",
                      style: Theme.of(context).boldText.copyWith(fontSize: 20)),
                ),
                const Spacer(),
                TextButton(
                  child: Text(
                    "Clear All |||",
                    style: Theme.of(context).boldText.copyWith(
                        fontSize: 16, decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    selectedTypes.clear();
                    context
                        .read<HomeBloc>()
                        .add(HomeFilterResourcesByType(selectedTypes));
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          for (final type in ResourceType.values) ...{
            MyCheckBox(
                checkedValue: selectedTypes.contains(type),
                onChanged: (value) {
                  setState(() {
                    if (value) {
                      selectedTypes.add(type);
                    } else {
                      selectedTypes.remove(type);
                    }
                  });
                  context
                      .read<HomeBloc>()
                      .add(HomeFilterResourcesByType(selectedTypes));
                },
                margin: const EdgeInsets.only(left: AppSpacing.xs),
                resourceType: type),
          }
        ],
      ),
    );
  }
}

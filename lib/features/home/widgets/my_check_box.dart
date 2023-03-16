import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/models/resources/resource.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class MyCheckBox extends StatelessWidget {

  final bool checkedValue;
  final Function(bool) onChanged;
  final EdgeInsets margin;
  final ResourceType resourceType;

  const MyCheckBox({
    Key? key, 
    required this.checkedValue,
    required this.onChanged,
    required this.margin,
    required this.resourceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color checkboxColor = Theme.of(context).colorScheme.secondary;
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: checkboxColor,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6)
          )
        )
      ),
      child: Container(
        margin: margin,
        child: GestureDetector(
          onTap: () {
            onChanged(!checkedValue);
          },
          child: Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  visualDensity: VisualDensity.compact,
                  activeColor: checkboxColor,
                  checkColor: Theme.of(context).colorScheme.background,
                  value: checkedValue,
                  onChanged: (newValue) {
                    onChanged(newValue ?? false);
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.lg,),
              Text(
                resourceType.toFrontendString().toUpperCase(),
                style: Theme.of(context).boldText,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
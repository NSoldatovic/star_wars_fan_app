import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/models/resources/resource.dart';

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
    Color checkboxColor = Colors.blue;
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
        child: CheckboxListTile(
          visualDensity: VisualDensity.compact,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          activeColor: checkboxColor,
          title: Text(
            resourceType.toString().toUpperCase()
          ),
          value: checkedValue,
          onChanged: (newValue) {
            onChanged(newValue ?? false);
          },
        ),
      ),
    );
  }

  // TextStyle formTextStyle() {
  //   return TextStyle(
  //     fontSize: font_size_text_field,
  //     color: AllServices().themeService.colorThemeService.colorTextFieldText(),
  //     fontFamily: font_barlow_regular
  //   );
  // }

}
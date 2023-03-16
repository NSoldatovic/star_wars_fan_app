import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({Key? key}) : super(key: key);

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> {

  String dots = "";

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  _startAnimation() async {
    while(mounted) {
      setState(() {
        if (dots.length == 3) {
          dots = "";
        } else {
          dots += ".";
        }
      });
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppSpacing.xxs),
      width: 35,
      child: Text(dots,
        style: Theme.of(context).headerRegularText.copyWith(fontSize: 24),),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/router.dart';
import 'package:star_wars_fan_app/ui_consts/app_spacing.dart';

class HomeErrorDialog {
  static show(BuildContext context, String errorText) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(errorText),
              const SizedBox(height: AppSpacing.lg,),
              Text("Check your internet connection!"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<HomeBloc>().add(HomeFetchResources());
                  context.goNamed(MyRouter.splashPageName);
                }, child: Text("TRY AGAIN ||")),
          ],
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/router.dart';
import 'package:star_wars_fan_app/utils/utils.dart';

class HomeErrorDialog {
  static show(BuildContext context, String errorText) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.standard),
          ),
          actionsPadding: const EdgeInsets.only(
            right: AppSpacing.lg,
            bottom: AppSpacing.lg,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(context.translate("error_dialog_title"),
              style: Theme.of(context).boldText.copyWith(fontSize: 24)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                errorText,
                style: Theme.of(context).normalText,
              ),
              const SizedBox(
                height: AppSpacing.sm,
              ),
              Text(
                context.translate("error_dialog_check_internet"),
                style: Theme.of(context).normalText,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.standard),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                context.read<HomeBloc>().add(HomeFetchResources());
                context.goNamed(MyRouter.splashPageName);
              },
              child: Text(
                context.translate("try_again"),
                style: Theme.of(context).buttonText,
              )
            ),
          ],
        );
      },
    );
  }
}

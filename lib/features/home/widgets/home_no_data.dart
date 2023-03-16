import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/router.dart';
import 'package:star_wars_fan_app/ui_consts/dimen.dart';

class HomeNoData extends StatelessWidget {
  const HomeNoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "NO DATA! |||",
            textAlign: TextAlign.center,
            style: Theme.of(context).boldText.copyWith(fontSize: 28),
          ),
          const SizedBox(
            height: AppSpacing.xxlg,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.standard),
                ),
              ),
              onPressed: () {
                context.goNamed(MyRouter.splashPageName);
                context.read<HomeBloc>().add(HomeFetchResources());
              },
              child: Text(
                "TRY AGAIN |||",
                style: Theme.of(context).buttonText,
              )),
        ]),
      ),
    );
  }
}

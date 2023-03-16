import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/view/home_resource_list.dart';
import 'package:star_wars_fan_app/features/home/widgets/home_error_dialog.dart';
import 'package:star_wars_fan_app/features/home/widgets/home_no_data.dart';
import 'package:star_wars_fan_app/features/search/search.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: StarWarsScaffold(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchResource(),
            const SizedBox(
              height: AppSpacing.sm,
            ),
            Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 4,
              width: double.infinity,
            ),
            BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
              if (state is HomeError) {
                HomeErrorDialog.show(context, state.errorText);
              }
            }, builder: (context, state) {
              if (state is HomeLoaded && state.resources.isNotEmpty) {
                return HomeResourceList(
                  resources: state.resources,
                );
              } else if (state is HomeSearchLoading) {
                return Expanded(
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  )),
                );
              } else if (state is HomeSearchNotFound) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "${context.translate("can_not_find_resource")}"
                      " \"${state.text}\" "
                      "😕",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).boldText.copyWith(fontSize: 16),
                  )),
                );
              } else {
                return const HomeNoData();
              }
            })
          ],
        ),
      ),
    );
  }
}

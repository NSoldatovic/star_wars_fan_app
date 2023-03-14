import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/view/home_resource_list.dart';
import 'package:star_wars_fan_app/features/search/search.dart';
import 'package:star_wars_fan_app/ui_consts/app_spacing.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: AppSpacing.lg,
              top: MediaQuery.of(context).padding.top,
              right: AppSpacing.lg,
              bottom: MediaQuery.of(context).padding.bottom
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SearchResource(),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                if (state is HomeLoaded) {
                  return HomeResourceList(
                    resources: state.resources,
                  );
                } else if (state is HomeSearchLoading) {
                  return Expanded(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    )),
                  );
                } else if (state is HomeSearchNotFound) {
                  return Expanded(
                    child: Center(
                        child: Text(
                            "Sorry, we can't find any resource that \nmatches |||" + " \"${state.text}\" " + "😕",
                          textAlign: TextAlign.center,
                    )),
                  );
                } else {
                  return Expanded(
                    child: Center(
                        child: Text(
                           "NO DATA! |||",
                          textAlign: TextAlign.center,
                        )),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

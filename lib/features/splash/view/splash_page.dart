import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/widgets/home_error_dialog.dart';
import 'package:star_wars_fan_app/router.dart';
import 'package:star_wars_fan_app/features/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeLoading) {
              context.read<SplashCubit>().startLoading(state.percentage);
            }
            if (state is HomeError) {
              HomeErrorDialog.show(context, state.errorText);
            }
          },
        ),
        BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              context.goNamed(MyRouter.homePageName);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(MyRouter.homePageName);
              },
              child: Text("Start"),
            ),
            BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
              final currentState = state;
              if (currentState is SplashLoading) {
                return Text("Loading... ${currentState.percentage}%");
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}

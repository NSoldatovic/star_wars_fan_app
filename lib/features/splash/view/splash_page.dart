import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/widgets/home_error_dialog.dart';
import 'package:star_wars_fan_app/features/splash/widgets/loading_dots.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/router.dart';
import 'package:star_wars_fan_app/features/splash/cubit/splash_cubit.dart';
import 'package:star_wars_fan_app/utils/utils.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: const SplashView(),
    );
  }
}


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double loadingBarWidth = screenWidth - (2 * AppSpacing.lg);
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
              context.read<SplashCubit>().close();
            }
          },
        ),
      ],
      child: StarWarsScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Center(
              child: Column(
                children: [
                  Text(
                    " @",
                    style: Theme.of(context).headerHollowText.copyWith(fontSize: 72),
                  ),
                  Text(
                    "FAN APP",
                    style: Theme.of(context).headerRegularText.copyWith(fontSize: 36),
                  ),
                ],
              ),
            ),
            BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
              final currentState = state;
              if (currentState is SplashLoading) {
                double loadingBarValue = loadingBarWidth * (currentState.percentage / 100) - 35;
                if (loadingBarValue < 0) {
                  loadingBarValue = 0;
                }
                return Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm, left: AppSpacing.sm),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(context.translate("splash_loading"),
                                style: Theme.of(context).headerRegularText.copyWith(fontSize: 24),),
                                const LoadingDots(),
                                Text(" ${currentState.percentage}",
                                style: Theme.of(context).headerRegularText.copyWith(fontSize: 24),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.xxs, left: AppSpacing.xxs),
                                child: Text("%", style: Theme.of(context).boldText.copyWith(fontSize: 24, fontWeight: FontWeight.w800),))
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppRadius.standard),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(AppSpacing.sm),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Container(
                                    width: loadingBarValue,
                                    margin: const EdgeInsets.only(right: 35),
                                    height: 5,
                                    decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(AppRadius.standard),
                                      color: Theme.of(context).contrastColor,
                                    ),
                                  ),
                                  Image.asset(
                                    image_loading_ship,
                                    // color: Theme.of(context).colorScheme.secondary,
                                    color: Theme.of(context).contrastColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
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

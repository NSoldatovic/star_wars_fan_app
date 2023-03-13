import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/splash/cubit/splash_cubit.dart';

List<SingleChildWidget> providers = [
  BlocProvider<SplashCubit>(
    create: (context) => SplashCubit(),
  ),
  BlocProvider<HomeBloc>(
    create: (context) => HomeBloc()..add(HomeFetchResources()),
  ),
];
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/view/home_resource_list.dart';
import 'package:star_wars_fan_app/features/search/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SearchResource(),
          BlocBuilder <HomeBloc, HomeState> (
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return HomeResourceList(
                    resources: state.resources,
                  );
                } else {
                  return Text("NO DATA");
                }
            }
          )
        ],
      ),
    );
  }
}

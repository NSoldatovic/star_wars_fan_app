import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/providers.dart';
import 'package:star_wars_fan_app/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: const StarWarsApp(),
    );
  }
}


class StarWarsApp extends StatefulWidget {
  const StarWarsApp({super.key});
  @override
  State<StarWarsApp> createState() => _StarWarsAppState();
}

class _StarWarsAppState extends State<StarWarsApp> {

  final router = MyRouter.getRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars Fan App',
      routerConfig: router,
    );
  }
}
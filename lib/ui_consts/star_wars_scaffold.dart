import 'package:flutter/material.dart';

class StarWarsScaffold extends StatelessWidget {
  const StarWarsScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom
        ),
        child: child
      ),
    );
  }
}

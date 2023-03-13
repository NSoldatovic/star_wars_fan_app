import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/search/animated_text_field.dart';

class SearchResource extends StatefulWidget {
  const SearchResource({Key? key}) : super(key: key);

  @override
  State<SearchResource> createState() => _SearchResourceState();
}

class _SearchResourceState extends State<SearchResource> {

  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSearchTextField(
        hintText: 'Search',
        controller: _controller,
        onTextChanged: (value) {
          context.read<HomeBloc>().add(HomeSearchValue(value));
        },
      ),
    );
  }
}

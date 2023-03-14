import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/widgets/my_check_box.dart';
import 'package:star_wars_fan_app/models/models.dart';

class ResourceFilter {
  static show(
      BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _FilterWidget();
      },
    );
  }
}

class _FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<_FilterWidget> {
  late List<ResourceType> selectedTypes;

  @override
  void initState() {
    super.initState();
    selectedTypes = context.read<HomeBloc>().selectedTypes;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => true);
      },
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom
          ),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("ALOO"),
                  const Spacer(),
                  TextButton(
                    child: Text("Clear All ||"),
                    onPressed: () {
                      selectedTypes.clear();
                      context.read<HomeBloc>().add(HomeFilterResourcesByType(selectedTypes));
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              for (final type in ResourceType.values) ...{
                MyCheckBox(
                    checkedValue: selectedTypes.contains(type),
                    onChanged: (value) {
                      setState(() {
                        if (value) {
                          selectedTypes.add(type);
                        } else {
                          selectedTypes.remove(type);
                        }
                      });
                      context.read<HomeBloc>().add(HomeFilterResourcesByType(selectedTypes));
                    },
                    margin: EdgeInsets.zero,
                    resourceType: type),
              }
            ],
          ),
        ),
      ),
    );
  }
}

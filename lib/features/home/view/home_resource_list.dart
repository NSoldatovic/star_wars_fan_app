import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_fan_app/features/home/bloc/home_bloc.dart';
import 'package:star_wars_fan_app/features/home/widgets/resource_filter.dart';
import 'package:star_wars_fan_app/models/models.dart';
import 'package:star_wars_fan_app/router.dart';
import 'package:star_wars_fan_app/ui_consts/app_spacing.dart';

class HomeResourceList extends StatefulWidget {

  final List<Resource> resources;

  const HomeResourceList({
    required this.resources,
    Key? key
  }) : super(key: key);

  @override
  State<HomeResourceList> createState() => _HomeResourceListState();
}

class _HomeResourceListState extends State<HomeResourceList> with TickerProviderStateMixin{

  late AnimationController _hideFabAnimation;

  @override
  void initState() {
    super.initState();
    _hideFabAnimation = AnimationController(
      duration: kThemeAnimationDuration,
      vsync: this
    );
    _hideFabAnimation.forward();
  }

  @override
  void dispose() {
    _hideFabAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.sm),
              itemCount: widget.resources.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.goNamed(MyRouter.resourceDetailsPageName, extra: widget.resources[index]);
                  },
                  child: Row (
                    children: [
                      Text(widget.resources[index].name+ "   "),
                      Text(widget.resources[index].type.toString()),
                    ],
                  ),
                );
              }
            ),
          ),
          ScaleTransition(
            alignment: Alignment.bottomRight,
            scale: _hideFabAnimation,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 64,
                    height: 64,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary
                    ),
                    margin: const EdgeInsets.all(AppSpacing.sm),
                    padding: const EdgeInsets.all(AppSpacing.xxs),
                    child: IconButton(onPressed: () {
                      ResourceFilter.show(context);
                    }, icon: const Icon(Icons.filter_list_rounded, size: 32,)),
                  ),
                ),
                if (context.read<HomeBloc>().selectedTypes.isNotEmpty) Positioned(
                  right: 12,
                  bottom: 54,
                  child: Container(
                    width: 12,
                    height: 12,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.error
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _handleScrollNotification (ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.reverse: {
            if (userScroll.metrics.maxScrollExtent != userScroll.metrics.minScrollExtent) {
              _hideFabAnimation.reverse();
            }
            break;
          }
          case ScrollDirection.forward: {
            if (userScroll.metrics.maxScrollExtent != userScroll.metrics.minScrollExtent) {
              _hideFabAnimation.forward();
            }
            break;
          }
          case ScrollDirection.idle: {
            break;
          }
        }
      }
    }
    return false;
  }
}

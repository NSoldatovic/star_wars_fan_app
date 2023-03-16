import 'package:flutter/material.dart';
import 'package:star_wars_fan_app/features/themes/app_theme.dart';
import 'package:star_wars_fan_app/services/all_services.dart';
import 'package:star_wars_fan_app/ui_consts/app_spacing.dart';

class AnimatedSearchTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onTextChanged;

  const AnimatedSearchTextField({Key? key, required this.hintText, required this.controller, required this.onTextChanged})
      : super(key: key);

  @override
  State<AnimatedSearchTextField> createState() => _AnimatedSearchTextFieldState();
}

class _AnimatedSearchTextFieldState extends State<AnimatedSearchTextField> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    widget.controller.addListener(_onTextChanged);
    AllServices().searchResourceService.setClearTextField(_clearText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).primaryColor,
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: (value) {
                widget.onTextChanged(value);
              },
              cursorColor: Theme.of(context).contrastColor,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          ScaleTransition(
            scale: _animation,
            child: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _clearText,
            ),
          ),
        ],
      ),
    );
  }

  void _onTextChanged() {
    if (widget.controller.text.isEmpty) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _clearText() {
    widget.controller.clear();
    widget.onTextChanged("");
    FocusScope.of(context).unfocus();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    AllServices().searchResourceService.setClearTextField(null);
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }
}

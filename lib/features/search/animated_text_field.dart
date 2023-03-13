import 'package:flutter/material.dart';

class AnimatedSearchTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onTextChanged;

  const AnimatedSearchTextField({Key? key, required this.hintText, required this.controller, required this.onTextChanged})
      : super(key: key);

  @override
  _AnimatedSearchTextFieldState createState() => _AnimatedSearchTextFieldState();
}

class _AnimatedSearchTextFieldState extends State<AnimatedSearchTextField>
    with SingleTickerProviderStateMixin {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: (value) {
                widget.onTextChanged(value);
              },
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
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }
}

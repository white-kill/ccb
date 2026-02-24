
import 'package:flutter/material.dart';

class AutoBounceIcon extends StatefulWidget {
  const AutoBounceIcon({super.key});

  @override
  _AutoBounceIconState createState() => _AutoBounceIconState();
}

class _AutoBounceIconState extends State<AutoBounceIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Cubic(0.4, 0.1, 0.1, 0.5),
      ),
    );

    // 设置动画重复执行
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Icon(Icons.arrow_downward, size: 48, color: Colors.blue),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
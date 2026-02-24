import 'package:flutter/material.dart';

class BouncingAnimationWidget extends StatefulWidget {
  final Widget child;
  final double bounceHeight;
  final Duration duration;

  const BouncingAnimationWidget({
    Key? key,
    required this.child,
    this.bounceHeight = 10.0,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _BouncingAnimationWidgetState createState() => _BouncingAnimationWidgetState();
}

class _BouncingAnimationWidgetState extends State<BouncingAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    // 定义动画范围
    _animation = Tween<double>(begin: 0, end: widget.bounceHeight).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    // 释放动画控制器资源
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
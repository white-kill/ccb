import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class WbLoadingWidget extends StatefulWidget {
  final ImageProvider image;
  final String loadingText;
  final double? imageSize;
  final Duration? duration;

  const WbLoadingWidget({
    super.key,
    required this.image,
    required this.loadingText,
    this.imageSize,
    this.duration,
  });

  @override
  State<WbLoadingWidget> createState() => _WbLoadingWidgetState();
}

class _WbLoadingWidgetState extends State<WbLoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration:widget.duration?? const Duration(milliseconds: 1200),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingThree();
  }

  Widget _buildLoadingThree() {
    return Center(
      child: Container(
        height: 98.w,
        width: 98.w,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          RotationTransition(
            alignment: Alignment.center,
            turns: _controller,
            child: Image(
              image: widget.image,
              height: widget.imageSize ?? 35.w,
              width: widget.imageSize ?? 35,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.w),
            child: BaseText(
              text: widget.loadingText,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'balance_logic.dart';

class BalanceEyeWidget extends StatefulWidget {
  final String openEye;
  final String closeEye;
  final double width;
  final double height;
  final Color? color;
  final Widget? appendWidget;
  final AlignmentGeometry? alignment;

  const BalanceEyeWidget({
    super.key,
    required this.openEye,
    required this.closeEye,
    this.width = 18,
    this.height = 10,
    this.color,
    this.appendWidget,
    this.alignment,
  });

  @override
  State<BalanceEyeWidget> createState() => _BalanceEyeWidgetState();
}

class _BalanceEyeWidgetState extends State<BalanceEyeWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BalanceLogic>(
      builder: (c) {
        return Container(
          height: widget.height,
          alignment: widget.alignment ?? Alignment.topCenter,
          child: Row(
            children: [
              Image(
                image: c.showValue.value
                    ? widget.openEye.png3x
                    : widget.closeEye.png3x,
                width: widget.width.w,
                height: widget.height.w,
              ).withOnTap(onTap: () {
                c.showBalance(show: !c.showValue.value);
              }),
              if (c.showValue.value) SizedBox(width: 6.w),
              if (c.showValue.value)
                widget.appendWidget ?? const SizedBox.shrink(),
            ],
          ),
        );
      },
      id: 'updateEyeBalance',
    );
  }
}

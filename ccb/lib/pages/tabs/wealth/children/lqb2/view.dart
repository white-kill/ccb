import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'logic.dart';
import 'state.dart';

class Lqb2Page extends BaseStateless {
  Lqb2Page({super.key});

  final Lqb2Logic logic = Get.put(Lqb2Logic());
  final Lqb2State state = Get.find<Lqb2Logic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String? get title => "龙钱宝2号";

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.black;

  @override
  Widget? get leftItem => IconButton(
    padding: EdgeInsets.zero,
    constraints: BoxConstraints(
      minWidth: 30.w,
      minHeight: 30.w,
    ),
    onPressed: () => Get.back(),
    icon: Image.asset(
      'assets/new_images/back.png',
      width: 8.w,
      height: 16.w,
      color: Colors.black,
    ),
  );

  @override
  List<Widget>? get rightAction => [
    IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: 30.w,
        minHeight: 30.w,
      ),
      onPressed: () => Get.back(),
      icon: Image.asset(
        'assets/new_images/cai_fu/children/question.png',
        width: 14.w,
        height: 14.w,
        color: Colors.black,
      ),
    ),
  ScalePointWidget(
  icColor: Colors.black,
  ).withPadding(right: 10.w, left: 10.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/cai_fu/children/lqb2.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 
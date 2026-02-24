import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'logic.dart';
import 'state.dart';

class SyPage extends BaseStateless {
  SyPage({super.key});

  final SyLogic logic = Get.put(SyLogic());
  final SyState state = Get.find<SyLogic>().state;


  @override
  String? get title => "速盈";

  @override
  // TODO: implement navColor
  Color? get navColor => Color(0xFF1C67E7);

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
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
    IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: 30.w,
        minHeight: 30.w,
      ),
      onPressed: () => Get.back(),
      icon: Image.asset(
        'assets/new_images/close.png',
        width: 14.w,
        height: 14.w,
        color: Colors.black,
      ),
    ),
  ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          // 主要内容图片
          Image.asset(
            'assets/new_images/cai_fu/children/sy.png',
            fit: BoxFit.fitWidth,
          ),
          // 立即上车按钮图片 - 定位到合适位置
          Positioned(
            top: screenWidth/375 * 407,
            left: 67.w,   // 根据效果图调整位置
            right: 67.w,  // 根据效果图调整位置
            child: GestureDetector(
              onTap: () => logic.onButtonClick(),
              child: Image.asset(
                'assets/new_images/cai_fu/children/sy_btn.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
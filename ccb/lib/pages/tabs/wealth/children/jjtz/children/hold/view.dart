import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';
import 'state.dart';

class JiJinHoldPage extends BaseStateless {
  JiJinHoldPage({Key? key}) : super(key: key);

  final logic = Get.put(JiJinHoldLogic());
  final state = Get.find<JiJinHoldLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: "持有",
        fontSize: 18.sp,
        color: Colors.black,
      );

  @override
  Widget? get leftItem => IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 30.w,
          minHeight: 30.w,
        ),
        icon: Image.asset(
          'assets/new_images/back.png',
          width: 8.w,
          height: 16.w,
          color: Colors.black,
        ),
        onPressed: () => Get.back(),
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
      child: Image.asset(
        'assets/new_images/cai_fu/children/jjtz/jjtz_cy.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 
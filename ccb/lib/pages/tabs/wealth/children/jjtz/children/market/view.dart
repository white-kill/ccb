import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';
import 'state.dart';

class JiJinMarketPage extends BaseStateless {
  JiJinMarketPage({Key? key}) : super(key: key);

  final logic = Get.put(JiJinMarketLogic());
  final state = Get.find<JiJinMarketLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: "市场",
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
        'assets/new_images/cai_fu/children/jjtz/jjtz_sc.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
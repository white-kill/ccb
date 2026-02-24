import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'bangdingshebei_logic.dart';
import 'bangdingshebei_state.dart';

class BangdingshebeiPage extends BaseStateless {
  BangdingshebeiPage({Key? key}) : super(key: key);

  final BangdingshebeiLogic logic = Get.put(BangdingshebeiLogic());
  final BangdingshebeiState state = Get
      .find<BangdingshebeiLogic>()
      .state;

  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Colors.blueAccent;


  @override
  Widget? get leftItem =>
      IconButton(
        icon: Image.asset(
          'assets/new_images/home/back.png',
          width: 12.w,
          height: 18.w,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      );

  @override
  List<Widget>? get rightAction =>
      [
        ScalePointWidget(
          icColor: Colors.white,
          dx: 35.w,
          left: 80.w,
        ).withPadding(right: 0.w),
        SizedBox(width: 8.w),
      ];


  @override
  Widget? get titleWidget =>
      Text(
        "绑定设备",
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
        ),
      );

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/bg_settig_bdsb@3x.png',
                width: screenWidth,
                height: screenWidth / 3240 * 6099,
                fit: BoxFit.fitWidth,
              ),
              Obx(() {
                return Positioned(
                    top: screenWidth / 3240 * 6099 * 0.024,
                    left: screenWidth * 0.4,
                    child: Text(logic.deviceModel.value, style: TextStyle(
                      color: Colors.black.withAlpha(120),
                      fontSize: 15.sp,
                    ),));
              }),
              Obx(() {
                return Positioned(
                    top: screenWidth / 3240 * 6099 * 0.104,
                    left: screenWidth * 0.4,
                    child: Text(logic.osVersion.value, style: TextStyle(
                      color: Colors.black.withAlpha(120),
                      fontSize: 15.sp,

                    ),));
              }),
              Positioned(
                  top: screenWidth / 3240 * 6099 * 0.258,
                  left: screenWidth * 0.4,
                  child: Text(formatIDNumber(AppConfig.config.balanceLogic.memberInfo.idCard), style: TextStyle(
                    color: Colors.black.withAlpha(120),
                    fontSize: 15.sp,

                  ),)),
              Positioned(
                  top: screenWidth / 3240 * 6099 * 0.338,
                  left: screenWidth * 0.4,
                  child: Text(secretPhoneNumber(AppConfig.config.balanceLogic.memberInfo.phone), style: TextStyle(
                    color: Colors.black.withAlpha(120),
                    fontSize: 15.sp,

                  ),)),
              Positioned(
                  top: screenWidth / 3240 * 6099 * 0.41,
                  left: screenWidth * 0.4,
                  child: Text("2024年03月22日 16:15", style: TextStyle(
                    color: Colors.black.withAlpha(120),
                    fontSize: 15.sp,
                  ),))
            ],
          ),
        ],
      ),
    );
  }
}

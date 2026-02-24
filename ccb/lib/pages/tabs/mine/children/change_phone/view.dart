import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';

class ChangePhonePage extends BaseStateless {

  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Colors.white;


  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset(
      'assets/new_images/home/back.png',
      width: 12.w,
      height: 18.w,
      color: Colors.black,
    ),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.black,
      dx: 35.w,
      left: 80.w,
    ).withPadding(right: 0.w),
    IconButton(
      icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w, color: Colors.black,),
      onPressed: () => Get.back(),
    ),
    SizedBox(width: 8.w),
  ];


  @override
  Widget? get titleWidget => Text(
    "修改手机号码",
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
    ),
  );




  @override
  Widget initBody(BuildContext context) {
    final logic = Get.put(ChangePhoneLogic());
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/bg_mine_xg@3x.png',
                width: screenWidth,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  top: screenWidth/3240 * 6030 * 0.026,
                  left: 12.sp,
                  child: Text(secretPhoneNumber(AppConfig.config.balanceLogic.memberInfo.phone), style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,

                  ),)),
              Positioned(
                  top: screenWidth/3240 * 6030 * 0.33,
                  left: 12.sp,
                  child: Text(secretPhoneNumber(AppConfig.config.balanceLogic.memberInfo.phone), style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,

                  ),))
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';

class MineBottomSettingMorePage extends BaseStateless {

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
    "更多",
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
    ),
  );


  @override
  Widget initBody(BuildContext context) {
    final logic = Get.put(MineBottomSettingMoreLogic());
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/new_images/mine/children/wdszgd.png',
                width: screenWidth,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  top: screenWidth/3204 * 6744 * 0.38,
                  left: screenWidth * 0.06,
                  child: Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.aqs);
                  })
              ),
              Positioned(
                  top: screenWidth/3204 * 6744 * 0.38,
                  left: screenWidth * 0.06 + screenWidth * 0.2 + screenWidth * 0.02,
                  child: Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.transferSettingPage);
                  })
              ),
              Positioned(
                  top: screenWidth/3204 * 6744 * 0.38,
                  left: screenWidth * 0.06 + screenWidth * 0.2 * 2 + screenWidth * 0.02 * 2,
                  child: Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                  )
              ),
              Positioned(
                  top: screenWidth/3204 * 6744 * 0.38,
                  left: screenWidth * 0.06 + screenWidth * 0.2 * 3 + screenWidth * 0.02 * 3,
                  child: Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }

}

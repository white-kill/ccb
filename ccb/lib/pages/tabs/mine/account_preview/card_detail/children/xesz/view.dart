import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class XeszPage extends BaseStateless {
  XeszPage({Key? key}) : super(key: key);

  final XeszLogic logic = Get.put(XeszLogic());
  final XeszState state = Get.find<XeszLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Colors.white;

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.white;

  @override
  // TODO: implement navTitleColor
  Color? get navTitleColor => Colors.white;


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
    ).withPadding(right: 10.w, left: 10.w),
    IconButton(
      icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w, color: Colors.black,),
      onPressed: () => Get.back(),
    ),
    SizedBox(width: 8.w),
  ];


  @override
  Widget? get titleWidget => Text(
    "限额设置",
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
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
                'assets/new_images/home/account/detail/children/xesz.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: screenWidth/3240 * 6089 * 0.03,
                left: screenWidth * 0.4,
                child: Text(getBankNo(), style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black.withAlpha(160),
                ),),
              ),
              Positioned(
                top: screenWidth/3240 * 6089 * 0.267,
                left: screenWidth * 0.4,
                child: Text("500000", style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400
                ),),
              ),
              Positioned(
                top: screenWidth/3240 * 6089 * 0.346,
                left: screenWidth * 0.4,
                child: Text("1000000", style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                ),),
              ),
              Positioned(
                top: screenWidth/3240 * 6089 * 0.424,
                left: screenWidth * 0.4,
                child: Text("365000000", style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                ),),
              ),
              Positioned(
                top: screenWidth/3240 * 6089 * 0.504,
                left: screenWidth * 0.4,
                child: Text("499", style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                ),),
              )
            ],
          ),

        ],
      ),
    );
  }

}
import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:ccb/utils/stack_position.dart';

import 'logic.dart';
import 'state.dart';

class WdfwPage extends BaseStateless {
  WdfwPage({Key? key}) : super(key: key);

  final WdfwLogic logic = Get.put(WdfwLogic());
  final WdfwState state = Get.find<WdfwLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String? get title => "网点服务";

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
          color: Colors.white,
        ),
      );

  @override
  List<Widget>? get rightAction {
    // 默认显示：更多按钮 + 关闭按钮
    return [
      ScalePointWidget(
        icColor: Colors.white,
      ).withPadding(right: 6.w),

      Icon(
        Icons.clear,
        color: Colors.white,
      ).withOnTap(onTap: () {
        Get.back();
      }).withPadding(
        right: 16.w,
      )
    ];
  }
  @override
  Widget initBody(BuildContext context) {
    StackPosition stackPosition = StackPosition(
        designWidth: 1080, designHeight: 2138, deviceWidth: screenWidth);
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/bg_wdfw@3x.png",
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              top: stackPosition.getY(260),
              left: stackPosition.getX(30),
              child: Row(
                children: [
                  Image(
                      image: 'card/location_icon'.png, width: 14.w, height: 16.h,color: Colors.white,),
                  SizedBox(width: 7.w),
                  Text(
                    AppConfig.config.balanceLogic.memberInfo.city,
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,color: Colors.white),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}

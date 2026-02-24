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

class ShjfPage extends BaseStateless {
  ShjfPage({Key? key}) : super(key: key);

  final ShjfLogic logic = Get.put(ShjfLogic());
  final ShjfState state = Get.find<ShjfLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  String? get title => "生活缴费";

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
  List<Widget>? get rightAction {
    // 默认显示：更多按钮 + 关闭按钮
    return [
      ScalePointWidget(
        icColor: Colors.black,
      ).withPadding(right: 6.w),

      Icon(
        Icons.clear,
        color: Colors.black,
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
      child: Stack(
        children: [
          Image.asset(
            "assets/images/bg_shjf@3x.png",
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              top: stackPosition.getY(195),
              left: stackPosition.getX(120),
              child: Text(
                AppConfig.config.balanceLogic.memberInfo.city,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}

import 'package:ccb/pages/other/navi_offset/navi_offset/navi_offset_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'navi_offset_state.dart';

class NaviOffsetPage extends BaseStateless {
  NaviOffsetPage({super.key})
      : super(title: Get.arguments?['title'] ?? '无title参数');
  final NaviOffsetLogic logic = Get.put(NaviOffsetLogic());
  final NaviOffsetState state = Get.find<NaviOffsetLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Color? get navColor => Get.arguments?['navColor'] ?? Colors.white;

  @override
  Widget? get leftItem => InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Icon(
            Icons.navigate_before,
            size: 30.h,
            color: Colors.black,
          ),
        ),
        onTap: () => Get.back(),
      );

  @override
  Widget? get titleWidget =>
      BaseText(text: title ?? '', fontSize: 18.sp, color: Colors.black);

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v
            ? Get.arguments['changeTitleColor'] ?? Colors.black
            : Get.arguments['defTitleColor'] ?? Colors.white;
      };
  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(top: ScreenUtil().statusBarHeight + kToolbarHeight),
      children: [
        if (logic.state.assetsImagePath != '')
          Image(
            image: logic.state.assetsImagePath.png3x,
            fit: BoxFit.fitWidth,
            width: 1.sw,
          )
      ],
    );
  }
}

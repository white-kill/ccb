import 'package:ccb/utils/common_right_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../utils/scale_point_widget.dart';
import 'fixed_nav_logic.dart';
import 'fixed_nav_state.dart';

class FixedNavPage extends BaseStateless {
  FixedNavPage({Key? key}) : super(key: key,title: Get.arguments?['title']??'无title参数');

  final FixedNavLogic logic = Get.put(FixedNavLogic());
  final FixedNavState state = Get.find<FixedNavLogic>().state;

  @override
  Color? get navColor => Get.arguments?['navColor']??Colors.white;

  @override
  Color? get titleColor => Get.arguments?['titleColor']??Colors.black;

  @override
  Color? get background =>  Get.arguments?['background'];

  @override
  Color? get backColor => Get.arguments?['backColor']??Get.arguments?['titleColor']??Colors.black;

  @override
  Widget? get leftItem {
    // 如果传入了自定义 leftWidget，直接使用
    if (Get.arguments?['leftWidget'] != null) {
      return Get.arguments?['leftWidget'];
    }
    // 否则使用默认的返回按钮
    return null; // 返回 null 将使用父类的默认实现
  }

  @override
  List<Widget>? get rightAction {
    // 1. 如果传入了自定义 rightWidget，直接使用
    if (Get.arguments?['rightWidget'] != null) {
      Widget customWidget = Get.arguments?['rightWidget'];
      return [customWidget];
    }
    
    // 2. 如果 hideRightAction 为 true，则不显示右边按钮
    if (Get.arguments?['hideRightAction'] == true) {
      return null;
    }
    
    // 3. 默认显示：更多按钮 + 关闭按钮
    return [
      ScalePointWidget(
        icColor: Get.arguments?['titleColor'] ?? Colors.black,
      ).withPadding(right: 6.w),

      Icon(
        Icons.clear,
        color: Get.arguments?['titleColor'] ?? Colors.black,
      ).withOnTap(onTap: () {
        Get.back();
      }).withPadding(
        right: 16.w,
      )
    ];
  }
  @override
  Widget initBody(BuildContext context) {
    // 如果传入了自定义 bodyWidget，直接使用
    if (Get.arguments?['bodyWidget'] != null) {
      return Get.arguments['bodyWidget'] as Widget;
    }

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (logic.state.assetsImagePath != '')
        Image(
          image: logic.state.assetsImagePath.png3x,
          fit: BoxFit.fitWidth,
          width: 1.sw,
        )
        else if (logic.state.fullImagePath != "")
          Image(
            image: AssetImage(logic.state.fullImagePath),
            fit: BoxFit.fitWidth,
            width: 1.sw,
          )
      ],
    );
  }
}

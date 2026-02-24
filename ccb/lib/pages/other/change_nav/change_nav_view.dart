import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../utils/scale_point_widget.dart';
import 'change_nav_logic.dart';
import 'change_nav_state.dart';

class ChangeNavPage extends BaseStateless {
  ChangeNavPage({super.key})
      : super(title: Get.arguments?['title'] ?? '无title参数');

  final ChangeNavLogic logic = Get.put(ChangeNavLogic());
  final ChangeNavState state = Get.find<ChangeNavLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Color? get navColor => Get.arguments?['navColor'] ?? Colors.white;

  @override
  Widget? get bottomNav {
    final bottomImage = Get.arguments?['bottomImage'];
    if (bottomImage == null) return null;
    return Image(
      image: bottomImage.toString().png3x,
      fit: BoxFit.fitWidth,
      width: 1.sw,
    );
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
      Obx(()=>ScalePointWidget(
        icColor: logic.navActionColor.value,
      ).withPadding(right: 6.w),),

      
          Obx(()=> Icon(
            Icons.clear,
            color: logic.navActionColor.value,
          ).withOnTap(onTap: () {
            Get.back();
          }).withPadding(
            right: 16.w,
          ))
        ];
  }

  @override
  Widget? get leftItem => InkWell(
        child: Obx(() => Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Icon(
                Icons.navigate_before,
                size: 30.h,
                color: logic.navActionColor.value,
              ),
            )),
        onTap: () => Get.back(),
      );

  @override
  Widget? get titleWidget => Obx(
        () => BaseText(
            text: title ?? '',
            fontSize: 18.sp,
            color: logic.navActionColor.value),
      );

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v
            ? Get.arguments['changeTitleColor'] ?? Colors.black
            : Get.arguments['defTitleColor'] ?? Colors.white;
      };

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

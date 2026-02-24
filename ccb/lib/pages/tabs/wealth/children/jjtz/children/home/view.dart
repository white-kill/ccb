import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';
import 'state.dart';

class JiJinHomePage extends BaseStateless {
  JiJinHomePage({Key? key}) : super(key: key);

  final logic = Get.put(JiJinHomeLogic());
  final state = Get.find<JiJinHomeLogic>().state;



  @override
  Widget? get titleWidget => Obx(() {
        return BaseText(
          text: "基金投资",
          fontSize: 18.sp,
          color: logic.navTitleColor.value,
        );
      });

  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem => Obx(() {
        return IconButton(
          icon: Image.asset(
            'assets/new_images/back.png',
            width: 8.w,
            height: 16.w,
            color: logic.navActionColor.value,
          ),
          onPressed: () => Get.back(),
        );
      });

  @override
  List<Widget>? get rightAction => [
        Obx(() {
          return IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: 30.w,
              minHeight: 30.w,
            ),
            onPressed: () {},
            icon: Image.asset(
              'assets/new_images/cai_fu/children/question.png',
              width: 14.w,
              height: 14.w,
              color: logic.navActionColor.value,
            ),
          );
        }),
        Obx(() {
          return ScalePointWidget(
            icColor: logic.navActionColor.value,
          ).withPadding(right: 10.w, left: 10.w);
        }),
        Obx(() {
          return IconButton(
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
              color: logic.navActionColor.value,
            ),
          );
        }),
      ];

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
        logic.navTitleColor.value = v ? Colors.black : Colors.white;
      };

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: (screenWidth/1080 * 874) + (screenWidth/1125 * 7071),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
            'assets/new_images/cai_fu/children/jjtz/jjtz_sy_top.png',
            fit: BoxFit.fitWidth,
              width: screenWidth,
          ),),
          Positioned(
            top: screenWidth/1080 * 874,
            left: 0,
            child: Image.asset(
              'assets/new_images/cai_fu/children/jjtz/jjtz_sy.png',
              fit: BoxFit.fitWidth,
              width: screenWidth,
            ),
          )
        ],
      ),
    );
  }
} 
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class YHKXQGengduoPage extends BaseStateless {
  YHKXQGengduoPage({Key? key}) : super(key: key);

  final GengduoLogic logic = Get.put(GengduoLogic());
  final GengduoState state = Get.find<GengduoLogic>().state;

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
          icon: Image.asset(
            'assets/new_images/close.png',
            width: 14.w,
            height: 14.w,
            color: Colors.black,
          ),
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
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/new_images/home/account/detail/children/gd.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    height: screenWidth / 3240 * 6051 * 0.075,
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.sczh);
                  })),
              Positioned(
                  top: screenWidth / 3240 * 6051 * 0.077,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    height: screenWidth / 3240 * 6051 * 0.075,
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.fixedNavPage, arguments: {
                      'title': '银行卡持有证明',
                      'fullImagePath':
                          'home/account/detail/children/cyzm.png'.newImgPath,
                    });
                  })),
              Positioned(
                  top: screenWidth / 3240 * 6051 * 0.152,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    height: screenWidth / 3240 * 6051 * 0.075,
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.ziXinZhengMing);
                  }))
            ],
          ),
        ],
      ),
    );
  }
}

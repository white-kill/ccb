import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:ccb/utils/stack_position.dart';

import '../../../../routes/app_pages.dart';

class MineSettingWidget extends StatefulWidget {
  const MineSettingWidget({super.key});

  @override
  State<MineSettingWidget> createState() => _MineSettingWidgetState();
}

class _MineSettingWidgetState extends State<MineSettingWidget> {
  @override
  Widget build(BuildContext context) {
    StackPosition stackPosition =
    StackPosition(designWidth: 1080, designHeight: 385, deviceWidth: 1.sw);
    return Stack(
      children: [
        Image(
            image: 'bg_mine_setting'.png3x, width: 1.sw, fit: BoxFit.fitWidth),
        Positioned(
            left: stackPosition.getX(20),
            top: stackPosition.getY(100),
            child: Container(
              alignment: Alignment.topCenter,
              width: stackPosition.getWidth(1040),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        width: stackPosition.getWidth(1040)/4,
                        height: stackPosition.getHeight(260),
                      ).withOnTap(onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '指纹',
                          'fullImagePath': 'mine/children/zw.png'.newImgPath,
                        });
                      })),
                  Expanded(
                      child: Container(
                        width: stackPosition.getWidth(1040)/4,
                        height: stackPosition.getHeight(260),
                      ).withOnTap(onTap: () {
                        Get.toNamed(Routes.xesz);
                      })),
                  Expanded(
                      child: Container(
                        width: stackPosition.getWidth(1040)/4,
                        height: stackPosition.getHeight(260),
                      ).withOnTap(onTap: () {
                        Get.toNamed(Routes.changePhone);
                      })),
                  Expanded(child: Container(
                    width: stackPosition.getWidth(1040)/4,
                    height: stackPosition.getHeight(260),
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.bangxingsheb);
                  })),
                ],
              ),
            )
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(width: stackPosition.getWidth(140), height: stackPosition.getHeight(60)).withOnTap(onTap: () {
            Get.toNamed(Routes.wdszgd);
          }),)
      ],
    );
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF6FCFF).withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}

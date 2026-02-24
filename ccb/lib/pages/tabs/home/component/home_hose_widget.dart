import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class HomeHoseWidget extends StatefulWidget {
  const HomeHoseWidget({super.key});

  @override
  State<HomeHoseWidget> createState() => _HomeHoseWidgetState();
}

class _HomeHoseWidgetState extends State<HomeHoseWidget> {

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _containerBg(
          width: screenWidth,
          height: screenWidth/3240 * 2457,
          imagePath: index == 0 ? 'bg_home_hose_buy' : 'bg_home_hose_rent',
        ),
        Positioned(
            left: 10,
            top: screenWidth/3240 * 2457 * 0.2,
            child:
        Container(
          width: screenWidth/2,
          height: screenWidth/3240 * 2457 * 0.15,
        ).withOnTap(onTap: () {
          setState(() {
            index = 1;
          });
        })),
        Positioned(
            right: 10,
            top: screenWidth/3240 * 2457 * 0.2,
            child:
            Container(
              width: screenWidth/5 * 2,
              height: screenWidth/3240 * 2457 * 0.15,
            ).withOnTap(onTap: () {
              setState(() {
                index = 0;
              });
            })),

        // 住房公积金
        if (index == 1)
        Positioned(
            left: screenWidth * 0.05,
            bottom: screenWidth/3240 * 2457 * 0.1,
            child:
            Container(
              width: screenWidth/12 * 4,
              height: screenWidth/3240 * 2457 * 0.12,
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.gongjijin);
            })),
        // 扫码
        if (index == 1)
          Positioned(
            right: screenWidth * 0.05,
            bottom: screenWidth/3240 * 2457 * 0.1,
            child:
            Container(
              width: screenWidth/12 * 4,
              height: screenWidth/3240 * 2457 * 0.12,
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.saoyisaoPage);
            })),
        if (index == 1) // 房贷预审
          Positioned(
              left: screenWidth * 0.05,
              top: screenWidth/3240 * 2457 * 0.45,
              child:
              Container(
                width: screenWidth/12 * 5,
                height: screenWidth/3240 * 2457 * 0.28,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.fdys);
              })),
        if (index == 1) // 我的贷款
          Positioned(
              left: screenWidth * 0.5,
              top: screenWidth/3240 * 2457 * 0.45,
              child:
              Container(
                width: screenWidth/12 * 5,
                height: screenWidth/3240 * 2457 * 0.28,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.zfwddk);
              })),
        if (index == 0) // 我要缴租
          Positioned(
              left: screenWidth * 0.5,
              top: screenWidth/3240 * 2457 * 0.45,
              child:
              Container(
                width: screenWidth/12 * 5,
                height: screenWidth/3240 * 2457 * 0.28,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '我要缴租',
                  'fullImagePath': 'home/children/wyjz.png'.newImgPath,
                });
              })),
        if (index == 0) // 我要租房
          Positioned(
              left: screenWidth * 0.1,
              top: screenWidth/3240 * 2457 * 0.75,
              child:
              Container(
                width: screenWidth/12 * 10,
                height: screenWidth/3240 * 2457 * 0.15,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '我要租房',
                  'fullImagePath': 'home/children/wyzf.jpg'.newImgPath,
                });
              })),
        if (index == 0) // 我要出租
          Positioned(
              left: screenWidth * 0.05,
              top: screenWidth/3240 * 2457 * 0.45,
              child:
              Container(
                width: screenWidth/12 * 5,
                height: screenWidth/3240 * 2457 * 0.28,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '我要出租',
                  'fullImagePath': 'home/children/wycz.png'.newImgPath,
                });
              })),
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
        color: const Color(0xffF2FBFD),
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}

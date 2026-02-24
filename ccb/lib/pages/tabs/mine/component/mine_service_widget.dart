import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/config/balance_config/balance_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:ccb/utils/stack_position.dart';

import '../../../../routes/app_pages.dart';

class MineServiceWidget extends StatefulWidget {
  const MineServiceWidget({super.key});

  @override
  State<MineServiceWidget> createState() => _MineServiceWidgetState();
}

class _MineServiceWidgetState extends State<MineServiceWidget> {
  @override
  Widget build(BuildContext context) {
    StackPosition stackPosition =
        StackPosition(designWidth: 1080, designHeight: 1180, deviceWidth: 1.sw);
    return Stack(
      children: [
        Image(
            image: 'bg_mine_service'.png3x, width: 1.sw, fit: BoxFit.fitWidth),
        // 打印流水
        Positioned(
            left: stackPosition.getX(100),
            top: stackPosition.getY(250),
            child: InkWell(
              onTap: () {
                AppPages.toPrintView();
              },
              child: Container(
                width: stackPosition.getWidth(120),
                height: stackPosition.getHeight(130),
              ),
            )
        ),
        // 个人信用报告
        Positioned(
            left: stackPosition.getX(310),
            top: stackPosition.getY(250),
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.minCreditPage,
                );
              },
              child: Container(
                width: stackPosition.getWidth(170),
                height: stackPosition.getHeight(130),
              ),
            )
        ),
        // 资信证明
        Positioned(
            left: stackPosition.getX(100),
            top: stackPosition.getY(420),
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.mineProvePage,
                );
              },
              child: Container(
                width: stackPosition.getWidth(120),
                height: stackPosition.getHeight(130),
              ),
            )
        ),
        // 银行卡持卡
        Positioned(
            left: stackPosition.getX(310),
            top: stackPosition.getY(420),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.proveApplicationPage);
              },
              child: Container(
                width: stackPosition.getWidth(170),
                height: stackPosition.getHeight(130),
              ),
            )
        ),
        // 缴费订单
        Positioned(
            left: stackPosition.getX(50),
            top: stackPosition.getY(770),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '订单',
                  'navColor': Colors.white,
                  'titleColor': Colors.black,
                  'image': 'bg_order_1',
                  'background': Colors.white,
                });
              },
              child: Container(
                width: stackPosition.getWidth(450),
                height: stackPosition.getHeight(80),
              ),
            )
        ),
        // 生活订单
        Positioned(
            left: stackPosition.getX(50),
            top: stackPosition.getY(890),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '订单',
                  'navColor': Colors.white,
                  'titleColor': Colors.black,
                  'image': 'bg_order_2',
                  'background': Colors.white,
                });
              },
              child: Container(
                width: stackPosition.getWidth(450),
                height: stackPosition.getHeight(80),
              ),
            )
        ),
        // 善融订单
        Positioned(
            left: stackPosition.getX(50),
            top: stackPosition.getY(1010),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '订单',
                  'navColor': Colors.white,
                  'titleColor': Colors.black,
                  'image': 'bg_order_3',
                  'background': Colors.white,
                });
              },
              child: Container(
                width: stackPosition.getWidth(450),
                height: stackPosition.getHeight(80),
              ),
            )
        ),

        /// 风险评估
        Positioned(
            right: stackPosition.getX(50),
            top: stackPosition.getY(150),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '个人客户风险评估问卷 ',
                  'navColor': const Color(0xff486CCC),
                  'image': 'bg_fxpg',
                  'background': Colors.white,
                  'titleColor': Colors.white,
                });
              },
              child: Container(
                width: stackPosition.getWidth(450),
                height: stackPosition.getHeight(450),
              ),
            )),
      ],
    );
  }
}

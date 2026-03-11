import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:ccb/config/balance_config/balance_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/rotate_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:ccb/utils/stack_position.dart';

import '../../../../config/balance_config/balance_logic.dart';
import '../../../../routes/app_pages.dart';
import '../../../index/index_logic.dart';

class MinePropertyWidget extends StatefulWidget {
  const MinePropertyWidget({super.key});

  @override
  State<MinePropertyWidget> createState() => _MinePropertyWidgetState();
}

class _MinePropertyWidgetState extends State<MinePropertyWidget> {
  @override
  Widget build(BuildContext context) {
    StackPosition stackPosition =
        StackPosition(designWidth: 1080, designHeight: 313, deviceWidth: 1.sw);
    return Stack(
      children: [
        Image(
            image: 'bg_mine_property'.png3x, width: 1.sw, fit: BoxFit.fitWidth),
        Positioned(
            left: stackPosition.getX(250),
            top: stackPosition.getY(0),
            child: GetBuilder<BalanceLogic>(
              builder: (c) {
                return Container(
                  height: 20.w,
                  padding: EdgeInsets.only(
                      top: c.showValue.value ? 5.w : 7.w, bottom: 5.w),
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Image(
                        image: c.showValue.value
                            ? "ic_home_eye_open2".png3x
                            : "ic_home_eye_close2".png3x,
                        width: c.showValue.value ? 18.w : 15.w,
                        height: 10.w,
                      ),
                      if (c.showValue.value) SizedBox(width: 6.w),
                      if (c.showValue.value)
                        RotatingWidget(
                          image: 'ic_home_ref2'.png3x,
                        ),
                    ],
                  ),
                ).withOnTap(onTap: () {
                  c.showBalance(show: !c.showValue.value);
                });
              },
              id: 'updateEyeBalance',
            )),
        Positioned(
            right: stackPosition.getX(20),
            top: stackPosition.getY(0),
            child: Container(
              height: stackPosition.getHeight(50),
              width: stackPosition.getWidth(100),
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.accountPreview);
            })),
        GetBuilder(
            id: 'updateBalance',
            builder: (BalanceLogic c) {
              return Positioned(
                left: stackPosition.getX(70),
                bottom: c.showValue.value
                    ? stackPosition.getY(50)
                    : stackPosition.getY(80),
                child: Column(
                  children: [
                    BalanceWidget(
                        size: 7,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: AppConfig.config.balanceLogic
                                                .balance(),
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ).withOnTap(onTap: () {
                  Get.toNamed(Routes.accountPreview, arguments: {'tabIndex': 0});
                }),
              );
            }),
        GetBuilder(
            id: 'updateBalance',
            builder: (BalanceLogic c) {
             return Positioned(
                right: stackPosition.getX(70),
               bottom: c.showValue.value
                   ? stackPosition.getY(60)
                   : stackPosition.getY(50),
                child: Container(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: c.showValue.value ? "--" : "****",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              );
            }),

      ],
    );
  }
}

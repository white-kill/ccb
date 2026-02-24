import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'logic.dart';
import 'state.dart';

class TaHangZhuanRuPage extends BaseStateless {
  TaHangZhuanRuPage({Key? key}) : super(key: key, title: "他行转建行");

  final TaHangZhuanRuLogic logic = Get.put(TaHangZhuanRuLogic());
  final TaHangZhuanRuState state = Get.find<TaHangZhuanRuLogic>().state;
  @override
  Color? get navColor => Colors.white;

  @override
  Color? get titleColor => Colors.black;

  @override
  Color? get backColor => Colors.black;

  @override
  List<Widget>? get rightAction => [
        Center(
          child: Text("管理", style: TextStyle(
            fontSize: 16.w,
            color: Colors.black
          ),).withPadding(
            right: 16.w,
          ),
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1080, designHeight: 2147, deviceWidth: screenWidth);

    return Container(
      child: Stack(
        children: [
          Image(
            image: 'thzr'.png,
            width: screenWidth,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: position.getY(269),
            right: position.getX(164),
            child:

            BaseText(
                text: AppConfig
                    .config.balanceLogic.memberInfo.bankList.first.bankCard
                    .maskBankCardNumber2(),
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              fontFamily: "MiSans"
            ),
          ),
          )
        ],
      ),
    );
  }
}

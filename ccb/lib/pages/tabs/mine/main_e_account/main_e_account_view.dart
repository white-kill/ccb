import 'package:ccb/config/app_config.dart';
import 'package:ccb/data/model/member_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../utils/string_util.dart';
import 'main_e_account_logic.dart';
import 'main_e_account_state.dart';

class MainEAccountPage extends BaseStateless {
  MainEAccountPage({Key? key}) : super(key: key, title: 'e账户开户');

  final MainEAccountLogic logic = Get.put(MainEAccountLogic());
  final MainEAccountState state = Get
      .find<MainEAccountLogic>()
      .state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;


  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery
            .of(context)
            .padding
            .top + AppBar().preferredSize.height;

    MemberInfoModel info = AppConfig.config.balanceLogic.memberInfo;


    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Obx(() =>
                  Container(
                    width: 1.sw,
                    child: Image(
                      image: logic.showFirst.value ? 'e_zh1'.png3x : 'e_zh2'
                          .png3x, fit: BoxFit.fitWidth,),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container(height: 45.w,).withOnTap(onTap: () {
                    logic.showFirst.value = false;
                  })),
                  Expanded(child: Container(height: 45.w,).withOnTap(onTap: () {
                    logic.showFirst.value = true;
                  })),
                ],
              ),

              Obx(() {
                return Positioned(
                    top: 70.w,
                    left: 150.w,
                    child: Text(
                      logic.showFirst.value ? _maskCustomerName(info.realName) :
                      secretPhoneNumberFour(info.phone), style: TextStyle(
                        height: 1.0,
                        color: Color(0xFF8C8C8C)
                    ),));
              }),

              Obx(() {
                if (logic.showFirst.value == false) {
                  return SizedBox.shrink();
                }
                else {
                  return Positioned(
                      top: 125.w,
                      left: 150.w,
                      child: Text(
                        getBankNo()
                        , style: TextStyle(
                          height: 1.0,
                        color: Color(0xFF8C8C8C)
                      ),));
                }

              }),
            ],
          )

        ],
      ),
    );
  }


  // 客户名称脱敏处理，只保留最后一个字符，前面的用*替换
  String _maskCustomerName(String name) {
    if (name.isEmpty) return name;
    if (name.length == 1) return '*';

    String firstChar = '*';
    String remainingChars = name.substring(1);
    return firstChar + remainingChars;
  }


  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imagePath.png3x,
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}

import 'package:ccb/pages/tabs/mine/account_preview/children/add_bank/add_bank_state.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'add_bank_logic.dart';


class AddBankPage extends BaseStateless {
  AddBankPage({Key? key}) : super(key: key);

  final AddBankLogic logic = Get.put(AddBankLogic());
  final AddBankState state = Get.find<AddBankLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Color(0xFF006CBE);

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
      color: Colors.white,
    ),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.white,
      dx: 35.w,
      left: 80.w,
    ).withPadding(right: 18.w)
  ];


  @override
  Widget? get titleWidget => Text(
        "新增账户",
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
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
                'assets/new_images/home/children/add_bank.png',
                  width: screenWidth,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  top: screenWidth/3240 * 6486 * 0.13,
                  left: screenWidth * 0.24,
                  child: Container(
                    width: screenWidth * 0.5,
                    height: screenWidth/3240 * 6486 * 0.02,
                    child: Text(getBankNo(), style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                      fontFamily: 'PingFangSC'
                    ),),

                  ))

            ],
          ),
        ],
      ),
    );
  }
} 
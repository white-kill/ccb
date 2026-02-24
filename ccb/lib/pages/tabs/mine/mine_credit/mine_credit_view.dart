import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'mine_credit_logic.dart';
import 'mine_credit_state.dart';

class MinCreditPage extends BaseStateless {
  MinCreditPage({Key? key}) : super(key: key, title: '个人信用报告');

  final MineCreditLogic logic = Get.put(MineCreditLogic());
  final MineCreditState state = Get.find<MineCreditLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return ListView(
      padding: EdgeInsets.zero,
      children: [

        _containerBg(
            width: 1.sw,
            height: 1.sh - navHeight,
            imagePath: 'bg_xybg',
            child: Text(AppConfig.config.balanceLogic.memberInfo.realName)
                .withPadding(top: 150.w, left: 42.w)),
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

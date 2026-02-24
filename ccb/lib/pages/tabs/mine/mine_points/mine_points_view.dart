import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'mine_points_logic.dart';
import 'mine_points_state.dart';

class MinePointsPage extends BaseStateless {
  MinePointsPage({Key? key}) : super(key: key, title: '积分汇');

  final MinePointsLogic logic = Get.put(MinePointsLogic());
  final MinePointsState state = Get.find<MinePointsLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Stack(
          children: [
            Image(
              width: 1.sw,
              image: 'bg_jfenh_new'.png3x,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              left: 1.sw - 138.w,
                top: 37.w,
                child: BaseText(
              text: AppConfig.config.balanceLogic.memberInfo.points,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ))
          ],
        )
      ],
    ).withContainer(
      width: 1.sw,
      height: 1.sh,
    );
  }
}

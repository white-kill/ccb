import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'crsjz_logic.dart';
import 'crsjz_state.dart';

class CrsjzPage extends BaseStateless {
  CrsjzPage({Key? key}) : super(key: key);

  final CrsjzLogic logic = Get.put(CrsjzLogic());
  final CrsjzState state = Get.find<CrsjzLogic>().state;

  @override
  Color? get navColor => Colors.blue;

  @override
  Widget? get titleWidget => const Text(
        'CRS尽职调查',
        style: TextStyle(fontSize: 18, color: Colors.white),
      );

  @override
  double? get lefItemWidth => 30.w;

  @override
  // TODO: implement leftItem
  Widget? get leftItem => Image(
        image: ('login_back').png3x,
        color: Colors.white,
        width: 20.w,
        height: 20.w,
      ).withOnTap(onTap: () {
        Get.back();
      });

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 1.sw,
          height: 50.w,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 16.w)),
              Text('姓名'),
              Padding(padding: EdgeInsets.only(left: 16.w)),
              Text(AppConfig.config.balanceLogic.memberInfo.realName),
            ],
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        Expanded(
            child: ListView(
          children: [
            Image(image: ('bg_crjz').png3x),
          ],
        ))
      ],
    );
  }
}

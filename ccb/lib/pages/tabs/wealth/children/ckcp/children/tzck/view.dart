import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class TzckView extends BaseStateless {
  TzckView({Key? key}) : super(key: key);

  final TzckLogic logic = Get.put(TzckLogic());
  final TzckState state = Get.find<TzckLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String? get title => "通知存款";

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get navColor => Color(0xFF2B56C9);

  @override
  Widget? get leftItem => InkWell(
    onTap: () {
      Get.back();
    },
    child: Container(
      height: 30,
      width: 30,
    ),
  );

  @override
  Widget initBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/new_images/cai_fu/children/tktz.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
} 
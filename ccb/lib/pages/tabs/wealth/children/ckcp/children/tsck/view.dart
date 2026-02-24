import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class TsckView extends BaseStateless {
  TsckView({Key? key}) : super(key: key);

  final TsckLogic logic = Get.put(TsckLogic());
  final TsckState state = Get.find<TsckLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String? get title => "";

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get navColor => Color(0xFF2B56C9);

  @override
  Widget? get leftItem => IconButton(
    padding: EdgeInsets.zero,
    constraints: BoxConstraints(
      minWidth: 30.w,
      minHeight: 30.w,
    ),
    onPressed: () => Get.back(),
    icon: Image.asset(
      'assets/new_images/back.png',
      width: 8.w,
      height: 16.w,
      color: Colors.white,
    ),
  );


  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/cai_fu/children/tsck.png',
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 
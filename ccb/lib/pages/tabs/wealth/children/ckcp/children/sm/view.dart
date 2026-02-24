import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class SMPage extends BaseStateless {
  SMPage({Key? key}) : super(key: key);

  final SMLogic logic = Get.put(SMLogic());
  final SMState state = Get.find<SMLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  String? get title => "结构性存款";

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get navColor => Color(0xFF3B6DD0);

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
        'assets/new_images/cai_fu/children/sm.png',
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

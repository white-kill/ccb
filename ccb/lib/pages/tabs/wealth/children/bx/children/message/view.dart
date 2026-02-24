import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';
import 'state.dart';

class BaoXianMessagePage extends BaseStateless {
  BaoXianMessagePage({Key? key}) : super(key: key);

  final logic = Get.put(BaoXianMessageLogic());
  final state = Get.find<BaoXianMessageLogic>().state;


  @override
  Color? get navColor => Color(0xFF2B63DA);

  @override
  // TODO: implement title
  String? get title => "我的保单";


  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.white;

  @override
  Widget? get leftItem => IconButton(
    padding: EdgeInsets.zero,
    constraints: BoxConstraints(
      minWidth: 30.w,
      minHeight: 30.w,
    ),
    icon: Image.asset(
      'assets/new_images/back.png',
      width: 8.w,
      height: 16.w,
      color: Colors.white,
    ),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [
    IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: 30.w,
        minHeight: 30.w,
      ),
      onPressed: () => Get.back(),
      icon: Image.asset(
        'assets/new_images/cai_fu/children/question.png',
        width: 14.w,
        height: 14.w,
        color: Colors.white,
      ),
    )
  ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/cai_fu/children/bx/bd_wdbd.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'logic.dart';
import 'state.dart';

class Lqb1Page extends BaseStateless {
  Lqb1Page({Key? key});

  final Lqb1Logic logic = Get.put(Lqb1Logic());
  final Lqb1State state = Get.find<Lqb1Logic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String? get title => "";

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.black;

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
      color: Colors.black,
    ),
  );


  List<Widget>? get rightAction =>
      [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/new_images/cai_fu/share.png', width: 14.w,
              height: 14.w,
              color: Colors.black),
        ),
        IconButton(
          icon: Image.asset('assets/new_images/cai_fu/ear.png', width: 14.w,
            height: 14.w,
            color: Colors.black,),
          onPressed: () => Get.toNamed('/ccbCustomerPage'),
        )
      ];


  @override
  Widget initBody(BuildContext context) {
    return           // 主要内容 - 整张图片
      Column(
        children: [
          Container(
            height: statusBarHeight,
            color: Colors.white,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Image.asset(
                'assets/new_images/cai_fu/children/lqb1.jpg',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      );
  }
}

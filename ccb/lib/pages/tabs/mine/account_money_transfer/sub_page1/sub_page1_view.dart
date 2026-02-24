import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../utils/scale_point_widget.dart';
import 'sub_page1_logic.dart';
import 'sub_page1_state.dart';

class Sub_page1Page extends BaseStateless {
  Sub_page1Page({Key? key}) : super(key: key,title: '境外外汇汇款');

  final Sub_page1Logic logic = Get.put(Sub_page1Logic());
  final Sub_page1State state = Get.find<Sub_page1Logic>().state;

  @override
  Color? get navColor =>  Colors.white;

  @override
  Color? get titleColor => Colors.black;


  @override
  Color? get backColor => Colors.black;

  @override
  List<Widget>? get rightAction => [

    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 6.w),

    Icon(
      Icons.clear,
      color: Colors.black,
    ).withOnTap(onTap: () {
      Get.back();
    }).withPadding(
      right: 16.w,
    )
  ];
  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 12.w,),
          Image(
            image: 'ic_jwwhhk1'.png3x,
            fit: BoxFit.fitWidth,
            width: 1.sw,
          ),
        SizedBox(height: 10.w,),
        Image(
          image: 'ic_jwwhhk2'.png3x,
          fit: BoxFit.fitWidth,
          width: 1.sw,
        ),
      ],
    );
  }
}

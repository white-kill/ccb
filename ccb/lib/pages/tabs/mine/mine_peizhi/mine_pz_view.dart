import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../utils/scale_point_widget.dart';
import 'mine_pz_logic.dart';
import 'mine_pz_state.dart';

class MinePzPage extends BaseStateless {
  MinePzPage({Key? key}) : super(key: key,title: Get.arguments?['title']??'设置');

  final MinePzLogic logic = Get.put(MinePzLogic());
  final MinePzState state = Get.find<MinePzLogic>().state;


  @override
  Color? get background => Colors.white;


  @override
  Color? get navColor => Get.arguments?['title'] == '面容'?const Color(0xff3C6DD3):Colors.white;


  @override
  Color? get titleColor =>  Get.arguments?['title'] == '面容'?Colors.white:Colors.black;

  @override
  Color? get backColor =>  Get.arguments?['title'] == '面容'?Colors.white:Colors.black;

  @override
  List<Widget>? get rightAction => [

    ScalePointWidget(
      icColor: Get.arguments?['title'] == '面容'?Colors.white:Colors.black,
    ).withPadding(right: 6.w),


    Icon(
      Icons.clear,
      color: Get.arguments?['title'] == '面容'?Colors.white:Colors.black,
    ).withOnTap(onTap: () {
      Get.back();
    }).withPadding(
      right: 16.w,
    )
  ];



  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Image(image: logic.image.png3x,fit: BoxFit.fitWidth,)
      ],
    );
  }
}

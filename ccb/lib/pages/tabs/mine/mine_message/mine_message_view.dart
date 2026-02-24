import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../routes/app_pages.dart';
import 'mine_message_logic.dart';
import 'mine_message_state.dart';

class MineMessagePage extends BaseStateless {
  MineMessagePage({Key? key}) : super(key: key,title: '消息');

  final MineMessageLogic logic = Get.put(MineMessageLogic());
  final MineMessageState state = Get.find<MineMessageLogic>().state;


  @override
  bool get isChangeNav => true;

  @override
  Color? get navColor => Colors.transparent;

  @override
  bool get noBackGround1 => false;

  @override
  Color? get titleColor => Colors.black;

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_ms_yd'.png3x,
      width: 38.w,
      height: 38.w,
    ).withOnTap(onTap: (){
      '确定将所有消息标记为已读'.dialog(title: '提示',);
    }),
    SizedBox(width: 12.w,),
    Image(
      image: 'ic_ms_sz'.png3x,
      width: 38.w,
      height: 38.w,
    ).withOnTap(onTap: (){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '消息设置',
        'image': 'bg_ms_setting',
      });
    }),

    SizedBox(width: 12.w,),
  ];


  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Image(
          image: 'bg_message'.png3x,
          fit: BoxFit.fitWidth,
          width: 1.sw,
        )

      ],
    );
  }
}

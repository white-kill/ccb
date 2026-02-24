import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';
import 'state.dart';

class JianHangYanXuanPage extends BaseStateless {
  JianHangYanXuanPage({Key? key}) : super(key: key);

  final logic = Get.put(JianHangYanXuanLogic());
  final state = Get.find<JianHangYanXuanLogic>().state;


  @override
  // TODO: implement title
  String? get title => "建行严选";

  @override
  Widget? get leftItem =>         IconButton(
    padding: EdgeInsets.zero,
    constraints: BoxConstraints(
      minWidth: 30.w,
      minHeight: 30.w,
    ),
    onPressed: () => Get.back(),
    icon: Image.asset(
      'assets/new_images/close.png',
      width: 14.w,
      height: 14.w,
      color: Colors.black,
    ),
  );

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
      ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/new_images/cai_fu/children/jjyx_top.png',
            fit: BoxFit.fitWidth,
          ),
          Image.asset(
            'assets/new_images/cai_fu/children/jjyx_bottom.png',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
} 
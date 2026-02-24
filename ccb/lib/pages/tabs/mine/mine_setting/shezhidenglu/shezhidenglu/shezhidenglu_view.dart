import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'shezhidenglu_logic.dart';
import 'shezhidenglu_state.dart';

class ShezhidengluPage extends BaseStateless {
  ShezhidengluPage({Key? key}) : super(key: key);

  final ShezhidengluLogic logic = Get.put(ShezhidengluLogic());
  final ShezhidengluState state = Get.find<ShezhidengluLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  double? get lefItemWidth => 62.w;

  @override
  Widget? get titleWidget => Text(
        "登陆密码",
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      );
  @override
  List<Widget>? get rightAction => [];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().statusBarHeight + kToolbarHeight + 20.w)),
          Container(
            color: Colors.white,
            height: 319.w,
            width: 1.sw,
            child: Image(image: 'bg_settig_login'.png3x, fit: BoxFit.fill),
          ),
          SizedBox(
            height: 130.w,
          ),
          Center(
            child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                width: 340.w,
                height: 44.w, // 增加总高度以容纳顶部文字
                decoration: BoxDecoration(
                  color: Color(0xFFCBD8EB),
                  borderRadius: BorderRadius.circular(5.w), // 加大圆角
                ),
                child: Center(
                  child: Text(
                    "确定",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ).withOnTap(onTap: () {
                    //Get.toNamed(Routes.loginPage)
                  }),
                )),
          )
        ],
      ),
    );
  }
}

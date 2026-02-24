import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';
import 'state.dart';

class JiJinFollowPage extends BaseStateless {
  JiJinFollowPage({Key? key}) : super(key: key);

  final logic = Get.put(JiJinFollowLogic());
  final state = Get.find<JiJinFollowLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
      text: "关注",
      fontSize: 18.sp,
      color: Colors.black
  );


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
          color: Colors.black,
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
            color: Colors.black,
          ),
        ),
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
        IconButton(
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
        ),
      ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30.w),
            child: Column(
              children: [
                Text(
                  '暂无关注产品',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12.w),
                GestureDetector(
                  onTap: () {
                    // 跳转到基金首页
                    logic.goToHomePage();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Text(
                      '去基金首页看看',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/new_images/cai_fu/children/jjtz/jjtz_gz.png',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}

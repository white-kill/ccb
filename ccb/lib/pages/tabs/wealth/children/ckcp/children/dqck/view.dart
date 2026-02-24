import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class DqckView extends BaseStateless {
  DqckView({Key? key}) : super(key: key);

  final DqckLogic logic = Get.put(DqckLogic());
  final DqckState state = Get.find<DqckLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  String? get title => "定期存款";

  @override
  Color? get titleColor => Colors.white;

  @override
  // TODO: implement navColor
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
        child: Column(
      children: [
        // Tab选项卡
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: Color(0xFF2B56C9),
          ),
          child: Obx(() => Row(
                children: state.tabTitles.asMap().entries.map((entry) {
                  int index = entry.key;
                  String title = entry.value;
                  bool isSelected = logic.selectedIndex.value == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => logic.selectTab(index),
                      child: Container(
                        height: 44,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                            ),
                            if (isSelected)
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Image.asset('assets/new_images/cai_fu/children/dqck/indicator.png',
                              width: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
        ),

        // 内容区域
        Obx(() => Stack(
          children: [
            Image.asset(
              state.tabImages[logic.selectedIndex.value],
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              bottom: 60,
              child: GestureDetector(
                  onTap: logic.onDepositClick,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Image.asset('assets/new_images/cai_fu/children/dqck/dqck_btn.png', width: screenWidth - 32.w,))
              ),
            ),
          ],
        )             // 显示对应的图片
        ),


      ],
    ));
  }
}

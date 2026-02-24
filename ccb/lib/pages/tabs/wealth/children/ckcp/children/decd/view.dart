import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class DecdView extends BaseStateless {
  DecdView({Key? key}) : super(key: key);

  final DecdLogic logic = Get.put(DecdLogic());
  final DecdState state = Get.find<DecdLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  String? get title => "大额存单";

  @override
  Color? get titleColor => Colors.white;

  @override
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
    return Column(
      children: [
        // Tab选项卡
        Container(
          height: 45,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: state.tabTitles.asMap().entries.map((entry) {
              int index = entry.key;
              String title = entry.value;
              return Obx(() {
                bool isSelected = logic.selectedIndex.value == index;
                return GestureDetector(
                  onTap: () => logic.selectTab(index),
                  child: Container(
                    width: screenWidth/4.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(left:
                        BorderSide(color: Color(0xFFDDDDDD), width: index == 0 ? 0 : 1),
                        bottom:
                        BorderSide(color: isSelected ? Color(0xFF0067B3) : Color(0xFFDDDDDD), width: isSelected ? 4 :  1),
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: isSelected ? Color(0xFF0067B3) : Color(0xFF353535),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ),

        // 内容区域
        Expanded(
          child: Obx(() => SingleChildScrollView(
              child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Image.asset(
                      state.tabImages[logic.selectedIndex.value],
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      top: screenWidth / 1125 * 2058 * 0.028,
                      left: screenWidth  * 0.38,
                      child: Text(
                        formatBankCard(0),
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black.withAlpha(80),
                        ),
                      ),
                    )
                  ]
              )
          )),
        ),
      ],
    );
  }
} 
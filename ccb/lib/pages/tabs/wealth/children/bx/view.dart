import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'children/home/view.dart';
import 'children/message/view.dart';
import 'logic.dart';
import 'state.dart';

class BaoXianMainPage extends BaseStateless {
  BaoXianMainPage({Key? key}) : super(key: key);

  final logic = Get.put(BaoXianMainLogic());
  final state = Get.find<BaoXianMainLogic>().state;

  @override
  bool get isShowAppBar => false;

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            switch (logic.currentIndex.value) {
              case 0:
                return BaoXianHomePage();
              case 1:
                return BaoXianMessagePage();
              default:
                return Container();
            }
          }),
        ),
        Container(
          height: 49.w,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            children: List.generate(state.tabItems.length, (index) {
              final item = state.tabItems[index];
              return Expanded(
                child: GestureDetector(
                  onTap: () => logic.changeTab(index),
                  child: Obx(() {
                    final selected = logic.currentIndex.value == index;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          selected ? item.selectedIcon : item.unselectedIcon,
                          width: 24.w,
                          height: 24.w,
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: selected ? Colors.blue : Colors.black54,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
} 
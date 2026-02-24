import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'children/home/view.dart';
import 'children/market/view.dart';
import 'children/follow/view.dart';
import 'children/hold/view.dart';
import 'logic.dart';
import 'state.dart';

class JiJinTouZiMainPage extends BaseStateless {
  JiJinTouZiMainPage({Key? key}) : super(key: key);

  final logic = Get.put(JiJinTouZiMainLogic());
  final state = Get.find<JiJinTouZiMainLogic>().state;

@override
  // TODO: implement isShowAppBar
  bool get isShowAppBar => false;

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            switch (logic.currentIndex.value) {
              case 0:
                return JiJinHomePage();
              case 1:
                return JiJinMarketPage();
              case 2:
                return JiJinFollowPage();
              case 3:
                return JiJinHoldPage();
              default:
                return Container();
            }
          }),
        ),
        Container(
          height: 56,
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
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(height: 2),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: selected ? Colors.blue : Colors.black54,
                            fontWeight:
                                selected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 12,
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

import 'package:ccb/pages/tabs/mine/ccb_home/print_progress/tab_bar_view1.dart';
import 'package:ccb/pages/tabs/mine/ccb_home/print_progress/tab_bar_view2.dart';
import 'package:ccb/pages/tabs/mine/ccb_home/print_progress/tab_bar_view3.dart';
import 'package:ccb/pages/tabs/mine/ccb_home/print_progress/tab_bar_view4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'print_progress_logic.dart';
import 'print_progress_state.dart';

class PrintProgressPage extends BaseStateless {
  PrintProgressPage({Key? key}) : super(key: key,title: '进度查询');

  final PrintProgressLogic logic = Get.put(PrintProgressLogic());
  final PrintProgressState state = Get.find<PrintProgressLogic>().state;
  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Color? get background => Color(0xFFF2F2F2);

  @override
  Widget? get leftItem => Image(
    image: 'ic_left_back_home'.png3x,
    width: 42.w,
    height: 30.w,
  )
      .withPadding(left: 10.w)
      .withOnTap(onTap: () => Get.offAndToNamed(Routes.ccbHomePage));

  @override
  List<Widget>? get rightAction => [
    Container(
      width: 85.w,
      height: 32.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'ic_min_right'.png3x,
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: Container().withOnTap(onTap: () {
                BaseBottomSheet.sheetContentWidget(
                    bgColor: const Color.fromARGB(255, 240, 240, 240),
                    topWidget: Image(
                      image: 'ic_jhdj_left1'.png3x,
                    ).withPadding(left: 12.w, right: 12.w).withContainer(
                      height: 68.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 1.sw,
                          height: 0.5.w,
                          color: const Color.fromARGB(255, 235, 235, 235),
                        ),

                        Image(
                          image: 'ic_jhdj_left2'.png3x,
                        ).withPadding(left: 12.w, right: 12.w),

                        Container(
                          height: 42.w,
                          alignment: Alignment.center,
                          child: BaseText(
                            text: "取消",
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ).withOnTap(onTap: () {
                          Get.back();
                        }),
                      ],
                    ));
                // Get
              })),
          Expanded(
              child: Container().withOnTap(onTap: () {
                Get.back();
              })),
        ],
      ),
    ).withPadding(right: 10.w),
  ];
  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 50.w,
          color: const Color.fromARGB(255, 243, 247, 249),
          padding: EdgeInsets.only(bottom: 8.w),
          child: orderTabBarBottom(),
        ),

        Expanded(
          child: tabContent(),
        ),
      ],
    );
  }



  ///* tabBar内容******/
  Widget tabContent() {
    return TabBarView(
      controller: state.tabController,
      children: const [
        TabBarView1(),
        TabBarView2(),
        TabBarView3(),
        TabBarView4(),
      ],
    );
  }

  ///* tabBar样式******/
  Widget orderTabBarBottom() {
    return TabBar(
      controller: logic.state.tabController,
      labelColor: Colors.black,
      labelPadding: EdgeInsets.only(bottom: 5.h,
        right: 15.w,
      ),
      indicatorColor: const Color(0xff283CB1),
      tabs: state.tabNameList.map((name) {
        return BaseText(text: name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),);
      }).toList(),
    ).withContainer(
      height: 40.h,
      padding: EdgeInsets.only(left: 15.w),
      width: 1.sw,
    );
  }
}

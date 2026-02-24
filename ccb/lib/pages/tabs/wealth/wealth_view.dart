import 'package:ccb/pages/subpages/search/search_items.dart';
import 'package:ccb/pages/tabs/wealth/wealth_items.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'wealth_logic.dart';
import 'wealth_state.dart';

class WealthPage extends BaseStateless {
  WealthPage({super.key});

  final WealthLogic logic = Get.put(WealthLogic());
  final WealthState state = Get.find<WealthLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get titleWidget => PlaceholderSearchWidget(
        contentList: const ['抖音红包'],
        width: 312,
        bgColor: const Color(0xffEAF2FD).withOpacity(0.8),
      );

  @override
  double? get lefItemWidth => 0;

  @override
  Widget? get leftItem => Container();

  @override
  List<Widget>? get rightAction => [
        NavActionWidget(
          left: 15.w,
          right: 16.w,
          title: '客服',
          image: 'ic_home_customer',
        ),
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero, //
        children: [
          Container(
            height: 97.5.w - 44.w + ScreenUtil().statusBarHeight,
            color: const Color.fromARGB(255, 249, 238, 220), //249,238.220
          ),
          Container(
              //margin: EdgeInsets.only(top: 0.w),
              //width: 375.w,
              height: 169.w,
              color: Colors.transparent,
              child: //Image(image: ('weal_head').png3x),
                  Stack(
                children: [
                  Image(image: ('weal_head').png3x),
                  Positioned(
                    left: 25.w,
                    top: 18.w,
                    child: Text(
                      '总资产',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff805114)),
                    ),
                  ),
                  GetBuilder(
                    builder: (WealthLogic c) {
                      return Positioned(
                        left: 25.w,
                        top: 50.w,
                        child: Obx(() {
                          return Text(
                            logic.isEyeOpen.value
                                ? '¥${state.accountViewModel.balance.bankBalance}'
                                : '******',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff805114)),
                          );
                        }),
                      );
                    },
                    id: 'updateUI',
                  ),
                  Positioned(
                    left: 70.w,
                    top: 18.w,
                    child: Obx(() {
                      return GestureDetector(
                        onTap: () {
                          logic.toggleEyeState();
                        },
                        child: Image(
                          width: 20.w,
                          height: 20.w,
                          image: logic.isEyeOpen.value
                              ? ('weal_eye_open').png3x
                              : ('weal_eye_close').png3x,
                        ),
                      );
                    }),
                  ),
                  Positioned(
                      left: 90.w,
                      top: 20.w,
                      child: Obx(() {
                        return Visibility(
                            visible: logic.reloadShow.value,
                            child: Image(
                                width: 20.w,
                                height: 16.w,
                                image: ('weal_reload').png3x));
                      })),
                  Positioned(
                    right: 25.w,
                    top: 18.w,
                    child: Text(
                      '昨日收益',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff805114)),
                    ),
                  ),
                  Positioned(
                    right: 25.w,
                    top: 50.w,
                    child: Obx(() {
                      return Text(
                        logic.isEyeOpen.value ? '¥ --' : '******',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff805114)),
                      );
                    }),
                  ),
                ],
              )),
          _buildGridPage(state.gridItems),
          Container(
            //margin: EdgeInsets.only(top: 0.w),
            height: 336.w,
            color: Colors.transparent,
            child: Image(image: ('weal_choose').png3x),
          ),
          Container(
            //margin: EdgeInsets.only(top: 0.w),
            height: 279.w,
            color: Colors.transparent,
            child: Image(image: ('weal_manage').png3x),
          ),
          Stack(
            children: [
              Container(
                //margin: EdgeInsets.only(top: 0.w),
                color: Colors.transparent,
                child: Image(image: ('weal_hot').png3x),
              ),
              Positioned(
                  top: screenWidth / 1125 * 666 * 0.25,
                  left: screenWidth * 0.05,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.szjrzhc);
                    },
                    child: Center(
                      child: Container(
                        width: screenWidth / 5.0 * 2,
                        height: screenWidth / 1125 * 666 - 60,
                      ),
                    ),
                  )),
              Positioned(
                  top: screenWidth / 1125 * 666 * 0.25,
                  right: screenWidth * 0.05,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.szjrzhc);
                    },
                    child: Center(
                      child: Container(
                        width: screenWidth / 5.0 * 2,
                        height: screenWidth / 1125 * 666 * 0.3,
                      ),
                    ),
                  )),
            ],
          ),
          Container(
            //margin: EdgeInsets.only(top: 0.w),
            height: 550.w,
            color: Colors.transparent,
            child: Image(image: ('weal_focus').png3x),
          ),
        ],
      ),
    );
  }

  Widget _buildGridPage(List<Map<String, String>> items) {
    return SizedBox(
      height: 130,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1.0,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          mainAxisExtent: 60,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              // 使用统一的产品点击事件处理方法
              logic.onProductClick(item['label']!);
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: 63,
                width: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item['image']!, width: 30, height: 30),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      item['label']!,
                      style:
                          const TextStyle(fontSize: 11, color: Colors.black87),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

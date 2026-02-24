import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../home_logic.dart';
import 'two_level_logic.dart';
import 'two_level_state.dart';

class TwoLevelPage extends StatelessWidget {
  TwoLevelPage({Key? key}) : super(key: key);

  final TwoLevelLogic logic = Get.put(TwoLevelLogic());
  final TwoLevelState state = Get.find<TwoLevelLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 主要内容
        Container(
          width: 1.sw,
          height: 1.sh,
          child: PageView(
            controller: state.pageController,
            onPageChanged: (index) {
              logic.changePage(index);
            },
            children: [
              _buildPage1(),
              _buildPage2(),
            ],
          ),
        ),
        // 全屏图片显示
        GetBuilder<TwoLevelLogic>(
          id: 'fullImage',
          builder: (_) {
            if (!state.showFullImage) return SizedBox.shrink();

            return GestureDetector(
              onTap: () {
                logic.hideFullImage();
              },
              child: Container(
                width: 1.sw,
                height: 1.sh,
                color: Colors.black.withOpacity(0.9),
                child: Center(
                  child: Image(
                    image: state.fullImageName.png,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // 第一个页面
  Widget _buildPage1() {
    StackPosition stackPosition =
        StackPosition(designWidth: 1080, designHeight: 2376, deviceWidth: 1.sw);

    return Container(
      child: Stack(
        children: [
          Image(
            image: "home_two".png,
            fit: BoxFit.fitWidth,
            width: 1.sw,
          ),
          Positioned(
            left: 70.w,
            top: 32.w,
            child: SizedBox(
              height: 25.w,
              child: PlaceholderSearchWidget(
                bgColor: Colors.white.withOpacity(0.1),
                width: 180.w,
                contentList: ['手机号收款超省心', '个人养老金来啦'],
              ),
            ),
          ),
          // 总资产和眼睛图标
          Positioned(
            left: 35.w,
            top: 475.w, // 根据设计调整位置
            child: GetBuilder<TwoLevelLogic>(
              id: 'balanceDisplay',
              builder: (logic) {
                return Row(
                  children: [
                    // 总资产金额
                    if (state.showBalance)
                      BaseText(
                        text: AppConfig.config.balanceLogic.balance(),
                        fontSize: 20.sp,
                        color: Colors.white,
                      )
                    else
                      BaseText(
                        text: '***',
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    SizedBox(width: 10.w),
                  ],
                );
              },
            ),
          ),
          Positioned(
            left: 100.w,
            top: 458.w, // 根据设计调整位置
            child: // 眼睛图标
                GetBuilder<TwoLevelLogic>(
              id: 'balanceDisplay',
              builder: (logic) {
                return GestureDetector(
                  onTap: () {
                    logic.toggleBalance();
                  },
                  child: Image(
                    image: state.showBalance
                        ? 'home_eye_on'.png
                        : 'home_eye_close'.png,
                    width: 15.w,
                    height: 15.w,
                  ),
                );
              },
            ),
          ),
          StackPositionGridWidget.custom(
              stackPosition: stackPosition,
              x: 0,
              y: 1515,
              bottomMargin: 347,
              crossCount: 4,
              itemCount: 8,
              onItemTap: (index) {
                logic.onItemTap(index);
              }).build(),
          Positioned(
              bottom: 30.w,
              left: 160.w,
              child: Container(
                width: 50.w,
                height: 50.w,
              ).withOnTap(onTap: () {
                Get.find<HomeLogic>().state.refreshController.twoLevelComplete();
              }))
        ],
      ),
    );
  }

  // 第二个页面
  Widget _buildPage2() {
    return Container(
      child: Stack(
        children: [
          // 这里可以放第二个页面的背景图
          Container(
            color: Color(0xFF5A9BFF),
            child: Image(
              image: "home_two_2".png, // 可以替换成其他图片
              fit: BoxFit.fitWidth,
              width: 1.sw,
            ),
          ),
          Positioned(
            left: 70.w,
            top: 32.w,
            child: SizedBox(
              height: 25.w,
              child: PlaceholderSearchWidget(
                bgColor: Colors.white.withOpacity(0.1),
                width: 180.w,
                contentList: ['手机号收款超省心', '个人养老金来啦'],
              ),
            ),
          ),
          Positioned(
              bottom: 30.w,
              left: 160.w,
              child: Container(
                width: 50.w,
                height: 50.w,
              ).withOnTap(onTap: () {
                Get.find<HomeLogic>().state.refreshController.twoLevelComplete();
              }))
        ],
      ),
    );
  }
}

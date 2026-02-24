import 'package:ccb/config/app_config.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'logic.dart';
import 'state.dart';

class YyhkPage extends BaseStateless {
  YyhkPage({Key? key}) : super(key: key);

  final YyhkLogic logic = Get.put(YyhkLogic());
  final YyhkState state = Get.find<YyhkLogic>().state;


  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Colors.white;

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.white;

  @override
  // TODO: implement navTitleColor
  Color? get navTitleColor => Colors.white;


  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset(
      'assets/new_images/home/back.png',
      width: 12.w,
      height: 18.w,
      color: Colors.black,
    ),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [

    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
    IconButton(
      icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w, color: Colors.black,),
      onPressed: () => Get.back(),
    ),
    SizedBox(width: 8.w),
  ];


  @override
  Widget? get titleWidget => Text(
    "预约换卡",
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
    ),
  );

  /// 构建还款申请页面的 bodyWidget
  Widget _buildHksqBody() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/hksq.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            // 银行卡号展示
            Positioned(
              top: 18.w,
              left: 193.w,
              child: BaseText(
                text: AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard.maskBankCardNumber(),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFF6B6B6B),
                ),
              ).withOnTap(onTap: () {
                _showHksqBottomModal();
              }),
            ),
            // 最上方 50.w 高度的点击区域
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _showHksqBottomModal();
                },
                child: Container(
                  height: 100.w,
                  color: Colors.transparent,
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }

  /// 显示还款申请底部弹窗
  void _showHksqBottomModal() {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/hksq_bottom.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    // 银行卡号展示
                    Positioned(
                      top: 60.w,
                      left: 140.w,
                      child: BaseText(
                        text: AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard.maskBankCardNumber(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 构建一键激活页面的 bodyWidget
  Widget _buildYjjhBody() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.asset(
            'assets/images/yjhkjh@3x.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  /// 构建有效期延期页面的 bodyWidget
  Widget _buildYxqyqBody() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/wxts.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            // 银行卡号展示
            Positioned(
              top: 32.w,
              right: 45.w,
              child: BaseText(
                text: AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard.maskBankCardNumber(),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFF6B6B6B),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget initBody(BuildContext context) {
    StackPosition stackPosition = StackPosition(designWidth: 1080, designHeight: 2134, deviceWidth: 1.sw);
    return Container(
      color: Colors.white,
      child: ListView(

        children: [
          Stack(
            children: [
              Image.asset(
                'assets/new_images/home/account/detail/children/yyhk.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              StackPositionGridWidget.custom(stackPosition: stackPosition, x: 0, y: 0, bottomMargin: 1650, crossCount: 1, itemCount: 3, onItemTap: (index) {
                if (index == 0) {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '还款申请',
                    'navColor': Colors.white,
                    'titleColor': Colors.black,
                    'bodyWidget': _buildHksqBody(),
                  });
                } else if (index == 1) {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '办卡进度查询',
                    'navColor': Colors.white,
                    'titleColor': Colors.black,
                    'fullImagePath': 'assets/images/hk_record@3x.png',
                  });
                } else if (index == 2) {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '一键激活',
                    'navColor': Colors.white,
                    'titleColor': Colors.black,
                    'bodyWidget': _buildYjjhBody(),
                    'rightWidget': ScalePointWidget(
                      icColor: Colors.black,
                    ).withPadding(right: 16.w),
                  });
                }
              }).build(),
              Positioned(
                  top: 210.w,
                  left: 0,
                  child: Container(
                width: 1.sw,
                height: 45.w,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '有效期延期',
                  'navColor': Colors.white,
                  'titleColor': Colors.black,
                  'bodyWidget': _buildYxqyqBody(),
                });
                  }))
            ],
          ),

        ],
      ),
    );
  }

}
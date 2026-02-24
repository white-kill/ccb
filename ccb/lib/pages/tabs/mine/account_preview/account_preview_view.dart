import 'dart:math';

import 'package:ccb/pages/tabs/mine/account_preview/component/account_top_widget.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'account_preview_logic.dart';
import 'account_preview_state.dart';

class AccountPreviewPage extends BaseStateless {
  AccountPreviewPage({super.key})
      : super(
          title: "账户总览",
        );

  final AccountPreviewLogic logic = Get.put(AccountPreviewLogic());
  final AccountPreviewState state = Get.find<AccountPreviewLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  bool get noBackGround1 => false;

  @override
  Color? get background => const Color(0xffF6F6F6);

  @override
  Widget? get leftItem => IconButton(
        icon: Image.asset(
          'assets/new_images/home/back.png',
          width: 12.w,
          height: 18.w,
          color: Colors.white,
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
          onPressed: () {
            Get.toNamed(
              Routes.ccbCustomerPage,
            );
          },
          icon: Image.asset(
            'assets/new_images/home/chat.png',
            width: 20.w,
            height: 20.w,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ScalePointWidget(
          btn: Image.asset(
            'assets/new_images/home/add.png',
            width: 20.w,
            height: 20.w,
            color: Colors.white,
          ),
          content: addDialog(),
          left: 80.w,
          dx: 35.w,
          dy: 0.w,
        ),
        SizedBox(
          width: 20,
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [const AccountTopWidget()],
    );
  }

  addDialog() {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: 'gallery_custom'.png,
              width: 16.w,
              height: 16.w,
              color: Colors.black,
            ).withPadding(
              left: 0.w,
              right: 8.w,
            ),
            BaseText(
              text: '建行客服',
              color: Colors.black,
            )
          ],
        )
            .withContainer(height: 40.w, alignment: Alignment.centerLeft)
            .withOnTap(onTap: () {
          SmartDialog.dismiss();
          Get.toNamed(
            Routes.ccbCustomerPage,
          );
        }),
        Row(
          children: [
            Image(
              image: 'gallery_home'.png,
              width: 16.w,
              height: 16.w,
              color: Colors.black,
            ).withPadding(
              left: 2.w,
              right: 8.w,
            ),
            BaseText(
              text: '首页',
              color: Colors.black,
            ),
          ],
        ).withContainer(height: 40.w, alignment: Alignment.centerLeft),
      ],
    ).withPadding(left: 10.w).withOnTap(onTap: () {
      SmartDialog.dismiss();
      Get.offAllNamed(Routes.tabs);
      // final IndexLogic logic = Get.put(IndexLogic());
      // logic.selectIndex(0);
    });
  }
}

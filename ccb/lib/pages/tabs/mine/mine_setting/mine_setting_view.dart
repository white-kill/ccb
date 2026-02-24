import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/pages/tabs/mine/mine_setting/mine_setting_sec.dart';
import 'package:ccb/pages/tabs/mine/mine_setting/mine_setting_top.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'mine_setting_logic.dart';
import 'mine_setting_state.dart';

class MineSettingPage extends BaseStateless {
  MineSettingPage({Key? key}) : super(key: key, title: '设置');

  final MineSettingLogic logic = Get.put(MineSettingLogic());
  final MineSettingState state = Get.find<MineSettingLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 20.w)),
        Row(
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              margin: EdgeInsets.only(left: 26.w, right: 14.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.w))),
              child: Image(
                image: 'ic_ccb_sex${logic.sex}'.png3x,
                width: 50.w,
                height: 50.w,
              ),
            ).withOnTap(onTap: () => Get.toNamed(Routes.personInfoPage)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  text: AppConfig.config.balanceLogic.memberInfo.realName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ).withOnTap(onTap: () => Get.toNamed(Routes.personInfoPage)),
                Padding(padding: EdgeInsets.only(top: 5.w)),
                BaseText(
                  text: AppConfig.config.balanceLogic.memberInfo.phone
                      .desensitize(),
                  fontSize: 12.sp,
                  color: const Color(0xff666666),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 100.w)),
            BaseText(
              text: "2025标准门户 >",
              fontSize: 12.sp,
              color: const Color(0xff1966FF),
            )
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 20.w)),
        Center(
          child: MineSettingSecWidget(),
        ),
        Padding(padding: EdgeInsets.only(top: 20.w)),
        Image(image: ('bg_setting_main').png3x),
        Padding(padding: EdgeInsets.only(top: 20.w)),
        Center(
          child: Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              width: 150.w,
              height: 40.w,
              // 增加总高度以容纳顶部文字
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.w), // 加大圆角
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // 更明显的阴影
                    blurRadius: 8.w,
                    spreadRadius: 2.w,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "安全退出",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp),
                ).withOnTap(onTap: () {
                  //Get.toNamed(Routes.loginPage)
                  ''.saveToken;
                  Get.offAllNamed(Routes.login);
                }),
              )),
        ),
        Padding(padding: EdgeInsets.only(top: 20.w)),
      ],
    );
  }
}

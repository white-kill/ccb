import 'package:ccb/pages/tabs/mine/component/mine_service_widget.dart';
import 'package:ccb/pages/tabs/mine/component/mine_setting_widget.dart';
import 'package:ccb/pages/tabs/mine/component/mine_task_widget.dart';
import 'package:ccb/pages/tabs/mine/component/mine_top_widget.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'component/mine_property_widget.dart';
import 'mine_logic.dart';
import 'mine_state.dart';

class MinePage extends BaseStateless {
  MinePage({super.key}) : super();

  final MineLogic logic = Get.put(MineLogic());
  final MineState state = Get.find<MineLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem => Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 12.w, bottom: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(
            image: 'login_out'.png3x,
            width: 16.w,
            height: 16.w,
            color: Colors.black,
          ),
          BaseText(
            text: '退出',
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.black,
            ),
          )
        ],
      )).withOnTap(onTap: () {
    '安全退出'.dialog(
        title: '提示',
        onBack: (v) {
          // NotificationHelper.getInstance().showNotification(
          // title: "95533",
          // body: "序号01的验证码888888，向张三尾号3333转账39999。00元", payload: "payload");
          if (v) {
            ''.saveToken;
            Get.offAllNamed(Routes.login);
          }
        });
  });

  @override
  double get lefItemWidth => 80.w;

  @override
  List<Widget>? get rightAction => [
        NavActionWidget(
          left: 16.w,
          title: '搜索',
          image: 'ic_search',
          // showTitle: true,
          routesName: Routes.search,
        ),
        const NavActionWidget(
          title: '设置',
          image: 'ic_setting',
          // showTitle: false,
          routesName: Routes.mineSettingPage,
        ),
        const NavActionWidget(
          title: '客服',
          // showTitle: false,
          image: 'ic_home_customer',
        ),
        const NavActionWidget(
          title: '消息',
          image: 'ic_home_message',
          // showTitle: false,
          routesName: Routes.mineMessagePage,
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xffF6FCFF),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          MineTopWidget(),
          MineTaskWidget(),
          MinePropertyWidget(),
          MineServiceWidget(),
          // SizedBox(height: 15,),
          MineSettingWidget(),
        ],
      ),
    );
  }
}

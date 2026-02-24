import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/transfer_setting/transfer_setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../routes/app_pages.dart';
import 'transfer_setting_logic.dart';

class TransferSettingPage extends BaseStateless {
  TransferSettingPage({Key? key}) : super(key: key, title: '设置');

  final TransferSettingLogic logic = Get.put(TransferSettingLogic());
  final TransferSettingState state = Get.find<TransferSettingLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Container(
          width: 1.sw,
          height: 1.sh - navHeight,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xffF6FCFF).withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 0.5,
                offset: const Offset(0, 1),
              ),
            ],
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: 'ic_zz_setting'.png3x,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 53.w,
                width: 1.sw,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.bindPhonePage);
              }),
              Container(
                height: 53.w,
                width: 1.sw,
              ).withOnTap(onTap: () {
                SmartDialog.show(builder: (context) {
                  return Image(
                    image: 'zzxesz'.png,
                    width: 1.sw - 60.w,
                  ).withOnTap(onTap: () {
                    SmartDialog.dismiss();
                  });
                });
              }),
              Container(
                height: 53.w,
                width: 1.sw,
              ),
              Container(
                height: 53.w,
                width: 1.sw,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '转账加强验证',
                  'image': 'zzjqyz',
                });
              }),
            ],
          ),
        )
      ],
    );
  }
}

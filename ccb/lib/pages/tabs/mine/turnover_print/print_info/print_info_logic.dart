import 'dart:math';

import 'package:ccb/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../../../utils/local_notifications.dart';
import 'print_info_state.dart';

class PrintInfoLogic extends GetxController {
  final PrintInfoState state = PrintInfoState();

  @override
  void onInit() {
    super.onInit();

    state.printData = Get.arguments['info'];

    Map<String, dynamic> data = state.printData.toJson();

    Future.delayed(const Duration(milliseconds: 1500), () {
      state.downBtnController.click();

      NotificationHelper.getInstance().showNotification(
          title: "建设银行",
          // body: "您申请的手机银行短信验证码为${Random().nextVerificationCode(6)}，口令有效期为5分钟",
          body: "【建设银行】短信验证码为${Random().nextVerificationCode(6)}，"
              "有效期5分钟，您正在手机银行交易。任何索要验证码的都是骗子，千万别给!",
          payload: "payload");
    });
    state.keyList.add('申请账户');
    state.valueList.add('建设银行 ${AppConfig.config.balanceLogic.card()}');
    data.forEach((k, v) {
      
      if (state.titleMap[k] == "电子邮箱") {
        state.keyList.add("获取方式");
        state.valueList.add("电子邮箱");
      }
      
      
      state.keyList.add(state.titleMap[k]);
      state.valueList.add(v);
    });
    // state.keyList.add('服务人员代码');
    // state.keyList.add('服务机构代码');
    //
    // state.valueList.add('textField');
    // state.valueList.add('textField');
  }

  Widget replaceAsterisksWithImages(String text,
      {double fontSize = 14, Color? color,double? size,double? bottom}) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style:
            TextStyle(fontSize: fontSize.sp, color: color ?? Color(0xff999999)),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
                  image: 'ic_ccb_xin'.png3x,
                  width:size?? 6.w,
                  height:size?? 6.w,
                  color: color ?? Color(0xff999999))
              .withPadding(bottom:bottom?? 2.w),
          alignment: PlaceholderAlignment.middle,
        ));
      }
    }

    return Text.rich(
      maxLines: 10,
      textAlign: TextAlign.right,
      TextSpan(children: spans),
    );
  }
}

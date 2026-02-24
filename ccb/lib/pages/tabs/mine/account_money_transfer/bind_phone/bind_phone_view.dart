import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'bind_phone_logic.dart';
import 'bind_phone_state.dart';

class BindPhonePage extends BaseStateless {
  BindPhonePage({Key? key}) : super(key: key,title: '手机号收款设置');

  final BindPhoneLogic logic = Get.put(BindPhoneLogic());
  final BindPhoneState state = Get.find<BindPhoneLogic>().state;

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
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        BaseText(text: '快来设置手机号收款',fontSize: 22.sp,).withPadding(
          top: 25.w,left: 12.w,right: 12.w
        ),
        BaseText(text: '您当前手机号 ${AppConfig.config.balanceLogic.memberInfo.phone.desensitize()} '
            '尚未绑定建行账户，点击「立即设置」，'
            'Ta就可以通过手机号向您转账了~',maxLines: 10,fontSize: 14.sp,color: Color(0xff999999),).withPadding(
            top: 20.w,left: 12.w,right: 12.w
        ),
        
        Image(image: 'ic_bind_phone'.png3x,fit: BoxFit.fitWidth,).withOnTap(onTap: (){
          Get.back();
        })
      ],
    );
  }
}

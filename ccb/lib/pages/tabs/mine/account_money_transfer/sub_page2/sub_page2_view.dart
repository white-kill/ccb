import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'sub_page2_logic.dart';
import 'sub_page2_state.dart';

class Sub_page2Page extends BaseStateless {
  Sub_page2Page({Key? key}) : super(key: key, title: '撤销转账');

  final Sub_page2Logic logic = Get.put(Sub_page2Logic());
  final Sub_page2State state = Get
      .find<Sub_page2Logic>()
      .state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;


  @override
  Color? get backColor => Colors.white;

  @override
  List<Widget>? get rightAction =>
      [

        BaseText(text: '说明', color: Colors.white,).withPadding(
            right: 12.w
        ).withContainer(
          alignment: Alignment.center
        ),

        Icon(
          Icons.more_horiz,
          color: Colors.white,
        ).withPadding(
          right: 16.w,
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55.w,
          width: 1.sw,
          color: Colors.white,
          padding: EdgeInsets.only(left: 12.w,right: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(text: '付款账号'),

              Row(
                children: [
                  BaseText(
                      text: AppConfig.config.balanceLogic.memberInfo.bankList
                          .first.bankCard.maskBankCardNumber()),
                  Image(
                    image: 'ic_zz_record_more'.png3x,
                    width: 12.w,
                    height: 20.w,
                    color: const Color(0xff666666),
                  )
                ],
              ),
              BaseText(text: '筛选',color: Colors.blueAccent,),
            ],
          ),
        ),
        
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: 'ic_mx_no_data'.png3x,
              width: 100.w,
              height: 100.w,
            ),
            SizedBox(
              height: 12.w,
            ),
            BaseText(
              text: '没有查询到符合条件的明细记录',
              fontSize: 12.sp,
              color: Color(0xff999999),
            ),
          ],
        ).withPadding(
          bottom: 150.w
        ))
      ],
    );
  }
}

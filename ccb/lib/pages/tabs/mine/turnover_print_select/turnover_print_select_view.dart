import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import '../turnover_print/turnover_print_view.dart';
import 'turnover_print_select_logic.dart';
import 'turnover_print_select_state.dart';

class TurnoverPrintSelectPage extends BaseStateless {
  TurnoverPrintSelectPage({Key? key}) : super(key: key, title: '活期账户流水打印');

  final TurnoverPrintSelectLogic logic = Get.put(TurnoverPrintSelectLogic());
  final TurnoverPrintSelectState state =
      Get.find<TurnoverPrintSelectLogic>().state;

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'nav_close'.png3x,
      width: 14.w,
      height: 14.w,
      color: Colors.black,
    ).paddingOnly(right: 16.w).withOnTap(onTap: () {
      Get.back();
    }),
  ];

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.w,
          width: 375.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 20.w, right: 12.w),
          child: Row(
            children: [
              Image(
                image: 'ic_print_ls'.png3x,
                width: 25.w,
                height: 25.w,
              ).withPadding(
                right: 10.w
              ),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: '流水打印申请',
                      fontSize: 15.sp,
                      color: const Color(0xff333333),
                    ),
                    BaseText(
                      text: '申请将活期账户明细文件发送至电子邮箱或邮寄到家',
                      maxLines: 5,
                      fontSize: 12.sp,
                      color: Color(0xff999999),
                    )
                  ],
                ),
              )),
              Image(
                image: 'ic_zh_mx_next'.png3x,
                width: 25.w,
                height: 25.w,
              ).withPadding(
                left: 10.w
              ),
            ],
          ),
        ).withOnTap(onTap: (){
          "".showLoading;
          Future.delayed(Duration(seconds: 1), () {
            SmartDialog.dismiss(status: SmartStatus.loading);
            Get.toNamed(Routes.turnoverPrintPage,);
          });
        }),
        SizedBox(height: 10.w,),
        Container(
          height: 70.w,
          width: 375.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 20.w, right: 12.w),
          child: Row(
            children: [
              Image(
                image: 'ic_print_jl'.png3x,
                width: 25.w,
                height: 25.w,
              ).withPadding(
                  right: 10.w
              ),
              Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: '申请记录查询',
                          fontSize: 15.sp,
                          color: const Color(0xff333333),
                        ),
                        BaseText(
                          text: '查询您在建行各渠道的明细申请记录及提取密码',
                          maxLines: 5,
                          fontSize: 12.sp,
                          color: Color(0xff999999),
                        )
                      ],
                    ),
                  )),
              Image(
                image: 'ic_zh_mx_next'.png3x,
                width: 25.w,
                height: 25.w,
              ).withPadding(
                  left: 10.w
              ),
            ],
          ).withOnTap(onTap: (){
            Get.toNamed(Routes.printRecordPage);
          }),
        ),
      ],
    );
  }
}

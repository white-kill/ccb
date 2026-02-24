import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'prove _application_logic.dart';
import 'prove _application_state.dart';

class ProveApplicationPage extends BaseStateless {
  ProveApplicationPage({Key? key}) : super(key: key,title: '银行卡持有证明申请');

  final ProveApplicationLogic logic = Get.put(ProveApplicationLogic());
  final ProveApplicationState state = Get.find<ProveApplicationLogic>().state;

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
                          text: '证明申请',
                          fontSize: 15.sp,
                          color: const Color(0xff333333),
                        ),
                        BaseText(
                          text: '申请将银行卡持有证明(加盖电子印章)发送至电子邮箱或邮寄到家',
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
          ),
        ),
      ],
    );
  }
}

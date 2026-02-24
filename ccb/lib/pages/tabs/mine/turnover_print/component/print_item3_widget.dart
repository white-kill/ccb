import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../turnover_print_logic.dart';
import '../turnover_print_state.dart';

class PrintItem3Widget extends StatefulWidget {
  const PrintItem3Widget({super.key});

  @override
  State<PrintItem3Widget> createState() => _PrintItem3WidgetState();
}

class _PrintItem3WidgetState extends State<PrintItem3Widget> {

  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());
  final TurnoverPrintState state = Get.find<TurnoverPrintLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 150.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BaseText(text: '交易对手（选填）').withPadding(
              left: 10.w,top: 14.w, bottom: 14.w
          ).withContainer(
            width: 350.w
          ),

          Container(
            height: 45.w,
            width: 350.w,
            child: Row(
              children: [
                Container(
                  width: 125.w,
                  padding: EdgeInsets.only(left: 10.w),
                  alignment: Alignment.centerLeft,
                  child: BaseText(
                    text: '对方账号',
                    fontSize: 14.sp,
                    color: const Color(0xff363636),
                  ),
                ),
                Expanded(child:TextFieldWidget(
                  hintText: '选填',
                  controller: state.controller1A,
                )),
              ],
            ),
          ),
          Container(
            width: 328.w,
            height: 1.w,
            color: const Color(0xffDDDDDD),
          ),
          SizedBox(
            height: 45.w,
            width: 350.w,
            child: Row(
              children: [
                Container(
                  width: 125.w,
                  padding: EdgeInsets.only(left: 10.w),
                  alignment: Alignment.centerLeft,
                  child: BaseText(
                    text: '对方户名',
                    fontSize: 14.sp,
                    color: const Color(0xff363636),
                  ),
                ),
                Expanded(child:TextFieldWidget(
                  hintText: '选填',
                  controller: state.controller2N,
                )),
              ],
            ),
          ),
          Container(
            width: 328.w,
            height: 1.w,
            color: Color(0xffDDDDDD),
          ),
        ],
      ),
    );
  }
}

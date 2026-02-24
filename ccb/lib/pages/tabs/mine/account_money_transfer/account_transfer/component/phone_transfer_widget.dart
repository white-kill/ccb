import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_transfer_logic.dart';
import 'account_transfer_widget.dart';

class PhoneTransferWidget extends StatefulWidget {
  const PhoneTransferWidget({super.key});

  @override
  State<PhoneTransferWidget> createState() => _PhoneTransferWidgetState();
}

class _PhoneTransferWidgetState extends State<PhoneTransferWidget> {
  final AccountTransferLogic logic = Get.put(AccountTransferLogic());


  @override
  void initState() {
    super.initState();
    logic.state.phoneFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (logic.state.phoneFocusNode.hasFocus) {
      logic.state.showPhoneTextField = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 152.w,
      margin: EdgeInsets.only(top: 12.w, right: 18.w, left: 18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      child: Column(
        children: [
          BaseText(
            text: "转给",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ).withContainer(
              height: (18 + 16).w,
              width: 340.w,
              padding: EdgeInsets.only(top: 12.w, left: 20.w)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Transfer.itemCellWidget(
                  title: "收款人",
                  hintText: '请输入收款人姓名',
                ),
              ),
              Container(
                width: 298.w,
                height: 1.w,
                color: const Color(0xffE7E9EB),
              ),
              Expanded(
                  child: Container(
                child: Transfer.itemCellWidget(
                  title: "收款手机号",
                  hintText: '请输入收款人手机号',
                  focusNode: logic.state.phoneFocusNode,

                ),
              )),
            ],
          ))
        ],
      ),
    );
  }
}

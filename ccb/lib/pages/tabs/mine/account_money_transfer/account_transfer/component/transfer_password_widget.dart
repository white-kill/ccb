import 'package:f_verification_box/f_verification_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_transfer_logic.dart';

class TransferPasswordWidget extends StatefulWidget {
  const TransferPasswordWidget({super.key});

  @override
  State<TransferPasswordWidget> createState() => _TransferPasswordWidgetState();
}

class _TransferPasswordWidgetState extends State<TransferPasswordWidget> {

  final AccountTransferLogic logic = Get.put(AccountTransferLogic());
  bool isEnd = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      height: 240.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.w),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 24.w,
              ),
              BaseText(
                text: '请输入取款密码',
                fontSize: 16.sp,
              ),
              Icon(
                Icons.clear,
                size: 24.w,
                color: Colors.grey,
              ).withOnTap(onTap: () {
                SmartDialog.dismiss();
              }),
            ],
          ).withPadding(
            top: 12.w,
            bottom: 12.w,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '请您谨慎输入账户取款密码，连续输入',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff999999),
                  ),
                ),
                TextSpan(
                  text: '3次',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: '将锁定',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff999999),
                  ),
                ),
              ],
            ),
          ).withPadding(left: 12.w, bottom: 8.w),



          VerificationBox(
            borderWidth: 1.w,
            obscureText: true,
            borderColor: Colors.black,
            onSubmitted:(String text, Function? clear){
              isEnd = true;
              setState(() {});
            },
            onChanged: (v){
              String value = v.toString();
              if(value.length<6 && isEnd){
                isEnd = false;
                setState(() {});
              }
            },
            textStyle: TextStyle(
              fontSize: 10.sp,
            ),
            cursorIndent: 50,
          ),
          SizedBox(
            height: 20.w,
          ),
          Container(
            width: 340.w,
            height: 45.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.w),
              color: isEnd ?null : const Color(0xffC5D9F8),
              gradient: isEnd
                  ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff3768CB), Color(0xff6FACF9)], // 渐变色列表
              ): null,
            ),
            child: BaseText(
              text: "确认",
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ).withOnTap(onTap: (){
            logic.transfer();
          })
        ],
      ).withPadding(left: 12.w, right: 12.w),
    );
  }
}

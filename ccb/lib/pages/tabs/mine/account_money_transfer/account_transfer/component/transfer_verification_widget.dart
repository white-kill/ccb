import 'dart:math';

import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/component/transfer_password_widget.dart';
import 'package:f_verification_box/f_verification_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/count_down_btn.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../utils/local_notifications.dart';
import '../account_transfer_logic.dart';
import '../account_transfer_state.dart';

class TransferVerificationWidget extends StatefulWidget {
  final String styleName;

  const TransferVerificationWidget({super.key, required this.styleName});

  @override
  State<TransferVerificationWidget> createState() =>
      _TransferVerificationWidgetState();
}


class _TransferVerificationWidgetState
    extends State<TransferVerificationWidget> {
  final AccountTransferLogic logic = Get.put(AccountTransferLogic());
  final AccountTransferState state = Get.find<AccountTransferLogic>().state;


  bool isEnd = false;
  /// 将数字金额转换为中文大写金额（人民币）
  /// 例如：155.00 → "人民币壹佰伍拾伍元整"
  String convertToChineseAmount(double amount) {
    // 检查金额是否为非负数
    if (amount < 0) {
      throw ArgumentError("金额不能为负数");
    }

    // 拆分为整数部分和小数部分
    int integerPart = amount.floor();
    int decimalPart = ((amount - integerPart) * 100).round();

    // 处理整数部分
    String integerStr = _convertIntegerPart(integerPart);
    // 处理小数部分
    String decimalStr = _convertDecimalPart(decimalPart);

    // 拼接结果
    String result = "人民币 $integerStr";
    if (decimalStr.isNotEmpty) {
      result += decimalStr;
    } else {
      result += "整"; // 如果没有小数部分，加“整”
    }

    return result;
  }

  /// 转换整数部分（元）
  String _convertIntegerPart(int number) {
    if (number == 0) {
      return "零元";
    }

    const List<String> units = ["", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿"];
    const List<String> digits = [
      "零",
      "壹",
      "贰",
      "叁",
      "肆",
      "伍",
      "陆",
      "柒",
      "捌",
      "玖"
    ];

    String str = number.toString();
    String result = "";

    for (int i = 0; i < str.length; i++) {
      int digit = int.parse(str[i]);
      int unitIndex = str.length - i - 1;
      String currentDigit = digits[digit];
      String currentUnit = units[unitIndex];

      // 处理“零”的情况（避免重复“零”）
      if (digit == 0) {
        if (i < str.length - 1 && int.parse(str[i + 1]) != 0) {
          result += "零";
        }
      } else {
        result += currentDigit + currentUnit;
      }
    }

    return result + "元";
  }

  /// 转换小数部分（角、分）
  String _convertDecimalPart(int decimal) {
    if (decimal == 0) {
      return ""; // 如果没有小数部分，返回空（整数部分已加“整”）
    }

    const List<String> units = ["角", "分"];
    const List<String> digits = [
      "零",
      "壹",
      "贰",
      "叁",
      "肆",
      "伍",
      "陆",
      "柒",
      "捌",
      "玖"
    ];

    String result = "";
    String decimalStr = decimal.toString().padLeft(2, '0');

    for (int i = 0; i < decimalStr.length; i++) {
      int digit = int.parse(decimalStr[i]);
      if (digit != 0) {
        result += digits[digit] + units[i];
      }
    }

    return result;
  }

  CountDownBtnController countDownBtnController = CountDownBtnController();

  String code = '';
  String inputCode = '--';

  String xuHao = '';
  @override
  void initState() {
    super.initState();

    code = Random().nextVerificationCode(6);
    xuHao =  Random().nextTwoDigitString();
    Future.delayed(const Duration(milliseconds: 1500),(){
      countDownBtnController.click();
      NotificationHelper.getInstance().showNotification(
          title: "95533",
          body: "序号$xuHao的验证码$code，"
              "向${state.nameTextController.text}尾号"
              "${state.accountTextController.text.getLastFourByList()}转账"
              "${state.moneyTextController.text}元", payload: "payload");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      height: 420.w,
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
                text: '转账',
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
          Row(
            children: [
              Image(
                image: 'ic_zz_next'.png3x,
                width: 20.w,
                height: 14.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              BaseText(
                text: state.nameTextController.text,
                fontSize: 16,
              ),
              BaseText(
                text: '（${state.bankData['name']}）',
                color: Color(0xff666666),
                fontSize: 12.sp,
              ),
            ],
          ).withPadding(left: 12.w, bottom: 8.w),
          Row(
            children: [
              NetImageWidget(
                url: state.bankData['url'],
                width: 14.w,
                height: 14.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              BaseText(
                text: state.accountTextController.text,
                fontSize: 16,
              ),
            ],
          ).withPadding(
            left: 12.w,
          ),
          Container(
            height: 75.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: '¥ ',
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: const Color(0xff3768CB),
                      ),
                    ),
                    BaseText(
                      text: NumberFormat("#,##0.00", "zh_CN")
                          .format(double.parse(state.moneyStr)),
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: const Color(0xff3768CB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.w,
                ),
                BaseText(
                  text: convertToChineseAmount(double.parse(state.moneyStr)),
                  fontSize: 14.sp,
                  color: const Color(0xff3768CB),
                )
              ],
            ),
          ),
          Row(
            children: [
              BaseText(text: widget.styleName),
            ],
          ).withContainer(
              width: 1.sw,
              padding: EdgeInsets.only(
                top: 20.w,
                bottom: 20.w,
                left: 12.w,
              )),
          Container(
            height: 50.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BaseText(
                  text: '已向您手机号${state.infoModel.phone.desensitize()}发送序号$xuHao的验证码(6分钟内有效)',
                  fontSize: 10.sp,
                  color: Color(0xff666666),
                  maxLines: 5,
                ).withContainer(width: 190.w,padding: EdgeInsets.only(left: 12.w,right: 4.w)),
                WzhCountDownBtn(
                  controller: countDownBtnController,
                  getVCode: () async {
                    return true;
                  },
                )
              ],
            ),
          ),
          VerificationBox(
            type: VerificationBoxItemType.underline,
            borderWidth: 1.w,
            obscureText: true,
            borderColor: Colors.black,
            onSubmitted:(String text, Function? clear){
              isEnd = true;
              setState(() {});
            },
            onChanged: (v){
              inputCode = v;
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
          ).withContainer(
            height: 55.w,
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
            if(!isEnd) return;
            SmartDialog.dismiss().then((v){
              AlterWidget.alterWidget(builder: (context) {
                return const TransferPasswordWidget();
              });
            });
          })
        ],
      ).withPadding(left: 12.w, right: 12.w),
    );
  }
}

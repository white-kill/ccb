import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/config/dio/interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_transfer_logic.dart';
import '../account_transfer_state.dart';
import 'account_transfer_widget.dart';

class TransferInfoWidget extends StatefulWidget {
  const TransferInfoWidget({super.key});

  @override
  State<TransferInfoWidget> createState() => _TransferInfoWidgetState();
}

class _TransferInfoWidgetState extends State<TransferInfoWidget>
    with WidgetsBindingObserver {
  final AccountTransferLogic logic = Get.put(AccountTransferLogic());
  final AccountTransferState state = Get.find<AccountTransferLogic>().state;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  bool showDialog = true;


  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset > 0 && state.moneyFocusNode.hasFocus) {
      state.moneyTextController.text = state.moneyStr;
    }
    if (bottomInset == 0) {
      if (state.moneyStr != '') {
        String money = NumberFormat("#,##0.00", "zh_CN")
            .format(double.parse(state.moneyStr));
        state.moneyTextController.text = money;
      }
      logic.update(['updateCardTransfer', 'updateBottom']);

      if(!state.phoneFocusNode.hasFocus && showDialog && state.showPhoneTextField){
        showDialog = false;
        '该手机号尚未绑定银行卡号，'
            '收款人可5日内回复短信收款，'
            '确认收款前资金会安全保留在您的账户中。'.dialog(
          contentAlign: TextAlign.left,
          contentStyle: TextStyle(
            color: const Color(0xff333333),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 1.8
          ),
          showCancel: false,
          onBack: (v){
            Get.back();
          }
        );

      }

    }
  }

  String formatToChineseUnitFull(double num) {
    const units = [
      '',
      '十',
      '百',
      '千',
      '万',
      '十万',
      '百万',
      '千万',
      '亿',
      '十亿',
      '百亿',
      '千亿',
      '万亿'
    ];
    const steps = [
      1,
      10,
      100,
      1000,
      10000,
      100000,
      1000000,
      10000000,
      100000000,
      1000000000,
      10000000000,
      100000000000,
      1000000000000
    ];

    if (num == 0) return '';

    int unitIndex = 0;
    for (int i = steps.length - 1; i >= 0; i--) {
      if (num >= steps[i]) {
        num /= steps[i];
        unitIndex = i;
        break;
      }
    }

    return units[unitIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 165.w,
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
            text: "转账金额",
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
              GetBuilder(
                builder: (AccountTransferLogic c) {
                  return Row(
                    children: [
                      Container(
                        color: const Color(0xffE2E2E2),
                        child: BaseText(
                          text: formatToChineseUnitFull(double.parse(
                              state.moneyStr.isNullOrEmpty
                                  ? '0'
                                  : state.moneyStr)),
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  ).withPadding(top: 5.w, left: 40.w);
                },
                id: 'upDataUnit',
              ),
              Transfer.itemCellWidget(
                  title: "¥",
                  hintText: '请输入转账金额',
                  controller: state.moneyTextController,
                  focusNode: state.moneyFocusNode,
                  textColor: const Color(0xff333333),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                    _DecimalTextInputFormatter(),
                    _MaxValueInputFormatter(1000000000), // 自定义的最大值限制
                  ],
                  onSubmitted: (v) {
                    logic.update(['updateBottom']);
                  },
                  onChanged: (value) {
                    state.moneyStr = value;
                    logic.update(['upDataUnit']);
                  }),
              Container(
                width: 298.w,
                height: 1.w,
                color: const Color(0xffE7E9EB),
              ),
              Expanded(
                  child: Row(
                    children: [
                      Row(
                                      children: [
                      BaseText(
                        text: '付款账户',
                        fontSize: 15.sp,
                      ).withContainer(
                          width: 110.w,
                          height: 45.w,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20.w)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseText(
                            text: "中国${AppConfig.config.balanceLogic.cardInfo()}",
                            fontSize: 14.sp,
                            color: const Color(0xff333333),
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          BaseText(
                            text: "余额￥${AppConfig.config.balanceLogic.balance()}",
                            color: const Color(0xff666666),
                            fontSize: 13.sp,
                          ),
                        ],
                      )
                                      ],
                                    ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(right: 20.w),
                          child: Icon(Icons.keyboard_arrow_right_sharp, color: Color(0xFFBEBEBE), weight: 1,))
                    ],
                  )),
            ],
          ))
        ],
      ),
    );
  }
}

class _DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 如果新值包含多个小数点，则返回旧值
    if (newValue.text.split('.').length > 2) {
      return oldValue;
    }
    return newValue;
  }
}

// 自定义 TextInputFormatter 限制最大值
class _MaxValueInputFormatter extends TextInputFormatter {
  final double maxValue;

  _MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    try {
      final number = double.parse(newValue.text);
      if (number > maxValue) {
        return oldValue; // 如果超过最大值，返回旧值
      }
      return newValue;
    } catch (e) {
      return oldValue;
    }
  }
}

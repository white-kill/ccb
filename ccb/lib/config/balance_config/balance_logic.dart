import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/utils/sp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../data/model/member_info_entity.dart';

class BalanceLogic extends GetxController {
  var showValue = false.obs;

  MemberInfoModel memberInfo = MemberInfoModel();

  @override
  void onInit() {
    super.onInit();
    // memberInfoData();
  }

  Future memberInfoData() async {
    if (token == '') return;
    await Http.post(Apis.memberInfo).then((value) {
      if (value is Map<String, dynamic>) {
        memberInfo = MemberInfoModel.fromJson(value);
        update(['updateBalance','updateUI','updateCard']);
      }
    });
  }

  void showBalance({
    bool show = false,
  }) {
    showValue.value = show;
    update(['updateBalance', 'updateEyeBalance']);
  }

  String balance() {
    var formatter = NumberFormat();
    var formattedNumber = formatter.format(memberInfo.accountBalance);
    return formattedNumber;
  }

  String cardInfo(){
    if(memberInfo.bankList.isNotEmpty){
      return '${memberInfo.bankList.first.bankName} （${memberInfo.bankList.first.bankCard.getLastFourByList()}）';
    }
    return '--';
  }

  String openOutlets(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.openOutlets;
    }
    return '--';
  }


  Widget cardInfoWidget() {
    if (memberInfo.bankList.isNotEmpty) {
      return Row(
        children: [
          BaseText(
            text: memberInfo.bankList.first.bankName,
            style: TextStyle(
                fontFamily: 'PingFangSC',
                fontWeight: FontWeight.w500, fontSize: 17, letterSpacing: 1),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: BaseText(
              text: ' (',
              style: TextStyle(
                  fontFamily: 'PingFangSC',
                  fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 1),
            ),
          ),
          BaseText(
            text: memberInfo.bankList.first.bankCard.getLastFourByList(),
            style: TextStyle(
                fontFamily: 'NumberMedium-8',
                fontWeight: FontWeight.w200, fontSize: 18, letterSpacing: 18 * 0.05),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: BaseText(
              text: ')',
              style: TextStyle(
                  fontFamily: 'PingFangSC',
                  fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 1),
            ),
          ),
        ],
      );
    }
    else {
      return const BaseText(
        text: "--",
        style: const TextStyle(
            fontFamily: 'PingFangSC',
            fontWeight: FontWeight.w500, fontSize: 16),
      );
    }

  }


  String card(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.bankCard.maskBankCardNumber();
    }
    return '--';
  }
}

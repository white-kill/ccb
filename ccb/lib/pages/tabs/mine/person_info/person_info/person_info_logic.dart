import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/data/model/member_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../config/app_config.dart';
import 'person_info_state.dart';

class Person_infoLogic extends GetxController {
  var navActionColor = Colors.black.obs;
  final Person_infoState state = Person_infoState();


  String sex = '1';
  late MemberInfoModel infoModel;

  @override
  void onInit() {
    _loadData();
    _loadbottomSheet();
    super.onInit();
    infoModel =  AppConfig.config.balanceLogic.memberInfo;
    if(infoModel.sex == ''){
      sex = '1';
    }else {
      sex = infoModel.sex;
    }
  }

  _loadbottomSheet() {
    state.bomttomSheets.assignAll([
      '拍照',
      '从相册选择',
      '恢复默认头像',
    ]);
  }
  _loadData() {
    state.items.assignAll([
      item(
        title: '客户信息',
        subtitle: '证件、地址、职业等信息',
        rightContent: '修改',
        rightImage: 'back_arrow',
        routeName: '',
      ),
      item(
        title: '签约手机号',
        subtitle: '',
        rightContent: AppConfig.config.balanceLogic.memberInfo.phone.desensitize(),
        rightImage: 'back_arrow',
        routeName: '',
      ),
      item(
        title: '签约分行',
        subtitle: '',
        rightContent:AppConfig.config.balanceLogic.memberInfo.bankList.isNotEmpty
            ? AppConfig.config.balanceLogic.memberInfo.bankList.first.branchBelongs:'--',
        rightImage: 'back_arrow',
        routeName: '',
      ),
      item(
        title: '涉税信息尽职调查',
        subtitle: '',
        rightContent: '',
        rightImage: 'back_arrow',
        routeName: '',
      ),
      item(
        title: '特定客户尽职调查',
        subtitle: '',
        rightContent: '',
        rightImage: 'back_arrow',
        routeName: '',
      ),
      item(
        title: '客户信息管控应急恢复',
        subtitle: '',
        rightContent: '',
        rightImage: 'back_arrow',
        routeName: '',
      ),
      item(
        title: '我的龙信商',
        subtitle: '',
        rightContent: '',
        rightImage: 'back_arrow',
        routeName: '',
      )
    ]);
  }
}

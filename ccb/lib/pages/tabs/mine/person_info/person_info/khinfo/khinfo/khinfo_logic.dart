import 'dart:convert';

import 'package:ccb/pages/tabs/mine/person_info/person_info/khinfo/khinfo/Kh_data.dart';
import 'package:ccb/utils/sp_util.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../../../config/app_config.dart';
import 'khinfo_state.dart';

class KhinfoLogic extends GetxController {
  final KhinfoState state = KhinfoState();

  @override
  void onInit() {
    super.onInit();
    if(kdData != ''){
      Map<String, dynamic> jsonMap = jsonDecode(kdData);
      state.khData = KhData.fromJson(jsonMap);
      update(['updateUI']);
    }
    _loaddata();
  }
  @override
  void onClose() {
    super.onClose();
    String jsonString = jsonEncode(state.khData.toJson());
    jsonString.saveKdData;
  }


  String time(String time){
    try {
      DateTime date = DateTime.parse(time);
      String normalizedInput = DateFormat('yyyy-MM-dd').format(date);
      if (normalizedInput != time) {
        return time;
      }
      return DateFormat('yyyy/**/dd').format(date);
    } catch (e) {
      return time; // 解析失败，格式不正确
    }
  }

  String idCodeStr(){

    if(AppConfig.config.balanceLogic.memberInfo.certificateEndTime == '2099-12-31'){
      return '长期';
    }else {
      String s1 = time(AppConfig.config.balanceLogic.memberInfo.certificateBeginTime);
      String s2 = time(AppConfig.config.balanceLogic.memberInfo.certificateEndTime);
      return '非长期有效\n$s1-$s2';
    }
  }


  void setContent(int index,String content){


    if(index == 6){
      state.khData.data10 = content;
    }

    if(index == 9){
      state.khData.data1 = content;
    }
    if(index == 10){
      state.khData.data2 = content;
    }
    if(index == 11){
      state.khData.data3 = content;
    }
    if(index == 12){
      state.khData.data4 = content;
    }
    if(index == 13){
      state.khData.data5 = content;
    }
    if(index == 14){
      state.khData.data6 = content;
    }
    if(index == 15){
      state.khData.data7 = content;
    }
    if(index == 16){
      state.khData.data8 = content;
    }
    if(index == 17){
      state.khData.data9 = content;
    }

  }



  _loaddata() {
    state.items.assignAll([
      item(
          title: '姓名',
          centerContent: '*${AppConfig.config.balanceLogic.memberInfo.realName.removeFirstChar()}',
          showrightImage: false,
          darkColor: true),
      item(
          title: '性别',
          centerContent: AppConfig.config.balanceLogic.memberInfo.sex == '2'?'女':'男',
          showrightImage: false,
          darkColor: true),
      item(
          title: '证件类型',
          centerContent: '居民身份证',
          showrightImage: false,
          darkColor: true),
      item(
          title: '证件号码',
          centerContent: AppConfig.config.balanceLogic.memberInfo.idCard.maskBankCardNumber(),
          showrightImage: false,
          darkColor: true),
      item(
          title: '证件有效期',
          centerContent: idCodeStr(),
          showrightImage: true,
          darkColor: true),
      item(
          title: '联系电话',
          centerContent: AppConfig.config.balanceLogic.memberInfo.phone.desensitize(),
          showrightImage: true,
          darkColor: true),
      item(
          title: '职业',
          centerContent: '请选择职业',
          showrightImage: true,
          showTextField: true,
          data: state.khData.data10,
          darkColor: true),
      item(
          title: '国家/地区',
          centerContent: '中国',
          showrightImage: true,
          darkColor: true),
      item(
          title: '住宅地址',
          centerContent: AppConfig.config.balanceLogic.memberInfo.city,
          showrightImage: true,
          darkColor: true),
      item(
          title: '住宅邮编地址',
          centerContent: '请输入住宅邮编地址',
          showrightImage: false,
          showTextField: true,
          data: state.khData.data1,
          darkColor: false),
      item(
          title: '住宅性质',
          centerContent: '请选择住宅性质',
          showrightImage: false,
          showTextField: true,
          data: state.khData.data2,
          darkColor: true),
      item(
          title: '住宅电话',
          centerContent: '区号-电话号码',
          showrightImage: false,
          showTextField: true,
          data: state.khData.data3,
          darkColor: false),
      item(
          title: '单位名称',
          centerContent: '请输入单位名称',
          showrightImage: false,
          showTextField: true,
          data: state.khData.data4,
          darkColor: false),
      item(
          title: '单位地址',
          centerContent: '请输入单位地址',
          showrightImage: true,
          showTextField: true,
          data: state.khData.data5,
          darkColor: true),
      item(
          title: '单位邮编地址',
          centerContent: '请输入单位邮编地址',
          showrightImage: false,
          showTextField: true,
          data: state.khData.data6,
          darkColor: false),
      item(
          title: '单位电话',
          centerContent: '区号-段话号码 -分机号',
          showrightImage: false,
          showTextField: true,
          data: state.khData.data7,
          darkColor: false),
      item(
          title: '学历',
          centerContent: '请选择学历',
          showrightImage: true,
          showTextField: true,
          data: state.khData.data8,
          darkColor: true),
      item(
          title: '婚姻状态',
          centerContent: '请选择婚姻状态',
          showrightImage: true,
          showTextField: true,
          data: state.khData.data9,
          darkColor: true)
    ]);
  }
}

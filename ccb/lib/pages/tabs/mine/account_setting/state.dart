import 'dart:convert';

import 'package:ccb/config/app_config.dart';
import 'package:ccb/data/model/member_info_entity.dart';
import 'package:ccb/utils/sp_util.dart';
import 'package:ccb/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ccb/utils/common_picker_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

class AccountSettingState {
  // --- Form Key ---
  final formKey = GlobalKey<FormState>();

  // --- Controllers for TextField ---
  late TextEditingController residentialAddressController;
  late TextEditingController residentialPostCodeController;
  late TextEditingController residentialPhoneController;
  late TextEditingController residentialTypeController;
  late TextEditingController companyNameController;
  late TextEditingController companyAddressController;
  late TextEditingController companyPostCodeController;
  late TextEditingController companyPhoneController;
  late TextEditingController companyPhoneExtController;
  
  // 三段式单位电话控制器
  late TextEditingController companyPhoneFirstController;   // 4位区号
  late TextEditingController companyPhoneSecondController;  // 8位电话号码
  late TextEditingController companyPhoneThirdController;   // 6位分机号
  
  // 两段式住宅电话控制器
  late TextEditingController residentialPhoneAreaController;    // 4位区号
  late TextEditingController residentialPhoneNumberController;  // 8位电话号码

  // --- Rx Variables for Pickers and Read-only fields ---
  // 基本信息
  final customerName = ''.obs; // 模拟数据
  final idType = '居民身份证'.obs;
  final idNumber = ''.obs;
  final gender = ''.obs;
  final idExpiryDate = ''.obs;
  final mobileNumber = ''.obs;
  final country = '中国'.obs;
  final education = ''.obs;
  final selectedEducation = Rxn<CommonPickerItem>();
  final maritalStatus = ''.obs;

  // 常住地址信息


  // 工作信息
  final occupation = '社会生产服务和生活服务人员'.obs;


  // 学历选项列表
  final List<CommonPickerItem> educationItems = [
    CommonPickerItem(title: '博士教育', value: '博士教育'),
    CommonPickerItem(title: '硕士教育', value: '硕士教育'),
    CommonPickerItem(title: '大学本科教育', value: '大学本科教育'),
    CommonPickerItem(title: '大学专科教育', value: '大学专科教育'),
    CommonPickerItem(title: '中等专业教育', value: '中等专业教育'),
    CommonPickerItem(title: '技工教育', value: '技工教育'),
    CommonPickerItem(title: '高中教育', value: '高中教育'),
    CommonPickerItem(title: '初中教育', value: '初中教育'),
    CommonPickerItem(title: '小学教育', value: '小学教育'),
    CommonPickerItem(title: '文盲或半文盲', value: '文盲或半文盲'),
    CommonPickerItem(title: '其他', value: '其他'),
  ];

  // 婚姻状况选项列表
  final List<CommonPickerItem> maritalStatusItems = [
    CommonPickerItem(title: '未婚', value: '未婚'),
    CommonPickerItem(title: '已婚', value: '已婚'),
    CommonPickerItem(title: '离异', value: '离异'),
    CommonPickerItem(title: '其他', value: '其他'),
  ];

  AccountSettingState() {
    MemberInfoModel info = AppConfig.config.balanceLogic.memberInfo;
    customerName.value = _maskCustomerName(info.realName);
    idNumber.value = formatIDNumberSmall(info.idCard);
    gender.value = AppConfig.config.balanceLogic.memberInfo.sex == '2'?'女':'男';
    String preFixStr = "非长期有效";
    if(info.certificateEndTime == '2099-12-31'){
      preFixStr =  '长期';
    }else {
      preFixStr = '非长期有效';
    }


    idExpiryDate.value = '$preFixStr\n${_maskDateMonth(info.certificateBeginTime)}-${_maskDateMonth(info.certificateEndTime)}';
    mobileNumber.value = secretPhoneNumberFour(info.phone);



    Map storeData = _getStoredData();

    // 初始化时可以从持久化存储或网络加载初始值
    residentialAddressController = TextEditingController(text: storeData['住宅地址'] ?? '');
    residentialPostCodeController = TextEditingController(text: storeData['住宅地址邮编'] ?? '');
    residentialPhoneController = TextEditingController(text: '');
    residentialTypeController = TextEditingController(text: storeData['住宅性质'] ?? '');
    companyNameController = TextEditingController(text: storeData['单位名称'] ?? '');
    companyAddressController = TextEditingController(text: storeData['单位地址'] ?? '');
    companyPostCodeController = TextEditingController(text: storeData['单位地址邮编'] ?? '');
    companyPhoneController = TextEditingController(text: '');
    companyPhoneExtController = TextEditingController(text: '');

    // 初始化三段式单位电话控制器
    companyPhoneFirstController = TextEditingController(text: storeData['单位电话区号'] ?? '');
    companyPhoneSecondController = TextEditingController(text: storeData['单位电话号码'] ?? '');
    companyPhoneThirdController = TextEditingController(text: storeData['单位电话分机号'] ?? '');

    // 初始化两段式住宅电话控制器
    residentialPhoneAreaController = TextEditingController(text: storeData['住宅电话区号'] ?? '');
    residentialPhoneNumberController = TextEditingController(text: storeData['住宅电话号码'] ?? '');

    // 设置选择器的初始值
    if (storeData['学历'] != null) {
      education.value = storeData['学历'];
    }

    if (storeData['婚姻状况'] != null) {
      maritalStatus.value = storeData['婚姻状况'];
    }

    if (storeData['职业'] != null) {
      occupation.value = storeData['职业'];
    }
  }



  // 获取存储的数据（这里需要根据你的实际存储方式实现）
  Map<String, dynamic> _getStoredData() {
    Map<String, dynamic>? localInfo;
    if (userInfo != "") {
      localInfo = jsonDecode(userInfo);
    }
    // 临时返回空Map，你需要根据实际存储方式替换
    return localInfo ?? {};
  }

  // 客户名称脱敏处理，只保留最后一个字符，前面的用*替换
  String _maskCustomerName(String name) {
    if (name.isEmpty) return name;
    if (name.length == 1) return '*';
    
    String firstChar = '*';
    String remainingChars = name.substring(1);
    return firstChar + remainingChars;
  }

  // 日期月份脱敏处理，将月份用**替换
  String _maskDateMonth(String date) {
    if (date.isEmpty) return date;
    
    // 将日期格式从 "2024-12-31" 转换为 "2024/**/31"
    String formattedDate = date.replaceAll("-", "/");
    List<String> parts = formattedDate.split('/');
    
    if (parts.length == 3) {
      return '${parts[0]}/**/${parts[2]}';
    }
    
    return formattedDate;
  }
}

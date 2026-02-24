import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';

import '../bank_list/bank_list_model.dart';
import '../add_partner/payee_model.dart';
import '../add_partner/payee_storage_service.dart';
import 'contants_list_state.dart';

class ContactsListLogic extends GetxController {
  final ContactsListState state = ContactsListState();

  List<ContactInfo> contactList = [];
  List<ContactInfo> topList = [];


  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    // 清空现有数据
    contactList.clear();
    
    // 1. 先加载本地保存的收款人数据
    await _loadLocalPayeeData();
    
    // 2. 再加载网络联系人数据
    Http.get(Apis.contactsList).then((v){
      // print(v);
      if(v is List){
        // 将网络数据添加到现有列表中
        List<ContactInfo> networkContacts = v.map((e) => ContactInfo.fromJson(e)).toList();
        contactList.addAll(networkContacts);
      }
      _handleList(contactList);
    });
  }
  
  // 加载本地保存的收款人数据
  Future<void> _loadLocalPayeeData() async {
    try {
      List<PayeeModel> localPayees = await PayeeStorageService.getPayeeList();
      
      print('加载本地收款人数据，共 ${localPayees.length} 个');
      
      for (PayeeModel payee in localPayees) {
        // 将 PayeeModel 转换为 ContactInfo
        Map<String, dynamic> contactData = payee.toContactInfoJson();
        ContactInfo contactInfo = ContactInfo.fromJson(contactData);

        contactInfo.isLocal = true;
        contactList.add(contactInfo);
        
        print('添加本地收款人: ${contactInfo.name} - ${contactInfo.bankName}');
      }
      
    } catch (e) {
      print('加载本地收款人数据失败: $e');
    }
  }
  
  // 刷新本地收款人数据（用于添加新收款人后实时更新）
  Future<void> refreshLocalPayeeData() async {
    print('开始刷新收款人名册的本地数据...');
    
    // 移除现有的本地收款人数据
    contactList.removeWhere((contact) => contact.isLocal == true);
    
    // 重新加载本地收款人数据
    await _loadLocalPayeeData();
    
    // 重新处理列表（排序、索引等）
    _handleList(contactList);
    
    print('收款人名册本地数据刷新完成');
  }
  
  // 公共方法：外部调用以完全刷新数据
  void refreshData() {
    loadData();
  }

  void _handleList(List<ContactInfo> list) {

    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contactList);

    // add header.
    contactList.insert(0, ContactInfo(name: 'header', tagIndex: '我'));


    update(['updateUI']);
  }

}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'payee_model.dart';
import 'payee_storage_service.dart';
import '../contacts_list/contants_list_logic.dart';

class AddPartnerLogic extends GetxController {
  final AddPartnerState state = AddPartnerState();
  
  @override
  void onReady() {
    super.onReady();
    // 监听必填输入框变化
    state.nameController.addListener(_onFormInputChanged);
    state.accountController.addListener(_onFormInputChanged);
  }
  
  // 表单输入变化回调
  void _onFormInputChanged() {
    update(); // 更新UI，包括按钮状态和收款网点显示
  }
  
  @override
  void onClose() {
    // 移除监听器，避免内存泄漏
    state.nameController.removeListener(_onFormInputChanged);
    state.accountController.removeListener(_onFormInputChanged);
    state.dispose();
    super.onClose();
  }
  
  // 检查是否应该显示收款网点输入框
  bool get shouldShowBranch => state.selectedBank != null;
  
  // 检查必填项是否都已填写（实时验证）
  bool get isFormValid {
    return state.nameController.text.trim().isNotEmpty &&
           state.accountController.text.trim().isNotEmpty &&
           state.selectedBank != null;
  }
  
  // 确定按钮点击
  void onConfirm() {
    if (!isFormValid) {
      return; // 如果表单无效，不执行任何操作
    }
    
    if (_validateForm()) {
      // TODO: 提交数据到服务器
      _submitForm();
    }
  }
  
  // 表单验证
  bool _validateForm() {
    if (state.nameController.text.trim().isEmpty) {
      _showError("请输入收款户名");
      return false;
    }
    
    if (state.accountController.text.trim().isEmpty) {
      _showError("请输入收款账号");
      return false;
    }
    
    if (state.selectedBank == null) {
      _showError("请选择收款银行");
      return false;
    }
    
    return true;
  }
  
  // 提交表单
  void _submitForm() async {
    try {
      // 收集表单数据
      PayeeModel payee = _collectFormData();
      
      // 保存到本地存储
      bool saveResult = await PayeeStorageService.savePayee(payee);
      
      if (saveResult) {
        // 获取当前收款人总数用于显示
        int count = await PayeeStorageService.getPayeeCount();
        
        // Get.snackbar(
        //   "成功",
        //   "收款人添加成功\n当前共有 $count 个收款人",
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: Colors.green.withOpacity(0.8),
        //   colorText: Colors.white,
        //   duration: const Duration(seconds: 2),
        // );
        //
        // 延迟返回，让用户看到成功提示
        Future.delayed(const Duration(seconds: 1), () {
          // 通知收款人名册刷新数据
          _refreshContactsListIfNeeded();
          state.selectedBank = null;
          state.nameController.clear();
          state.accountController.clear();
          state.phoneController.clear();
          state.aliasController.clear();
          state.bankController.clear();
          state.branchController.clear();
          Get.back();
        });
      } else {
        _showError("保存收款人失败，请重试");
      }
    } catch (e) {
      print('提交表单出错: $e');
      _showError("添加收款人失败: $e");
    }
  }
  
  // 收集表单数据
  PayeeModel _collectFormData() {
    // 获取表单输入的值，去除首尾空格
    String name = state.nameController.text.trim();
    String account = state.accountController.text.trim();
    String? branch = state.branchController.text.trim();
    String? phone = state.phoneController.text.trim();
    String? alias = state.aliasController.text.trim();
    
    // 获取选择的银行信息
    Map<String, dynamic> bankInfo = Map<String, dynamic>.from(state.selectedBank!);
    String bankName = bankInfo['name'] ?? '';
    String bankUrl = bankInfo['url'] ?? '';
    String bankId = bankInfo['id'] ?? '';
    
    // 将空字符串转换为null（可选字段）
    branch = branch.isEmpty ? null : branch;
    phone = phone.isEmpty ? null : phone;
    alias = alias.isEmpty ? null : alias;
    
    // 创建PayeeModel对象
    PayeeModel payee = PayeeModel(
      name: name,
      account: account,
      bankName: bankName,
      bankUrl: bankUrl,
      bankId: bankId,
      branch: branch,
      phone: phone,
      alias: alias,
      createdAt: DateTime.now(),
    );
    
    print('收集到的表单数据: ${payee.toString()}');
    print('JSON数据: ${payee.toJson()}');
    
    return payee;
  }
  
  // 显示错误信息
  void _showError(String message) {
    Get.snackbar(
      "提示",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
  
  // 刷新收款人名册数据（如果收款人名册页面存在）
  void _refreshContactsListIfNeeded() {
    try {
      // 尝试找到收款人名册的控制器
      if (Get.isRegistered<ContactsListLogic>()) {
        ContactsListLogic contactsListLogic = Get.find<ContactsListLogic>();
        print('找到收款人名册控制器，正在刷新数据...');
        contactsListLogic.refreshLocalPayeeData();
      } else {
        print('收款人名册控制器未注册，跳过刷新');
      }
    } catch (e) {
      print('刷新收款人名册数据失败: $e');
    }
  }
  
  // 调试方法：查看本地存储的收款人列表
  Future<void> debugShowPayeeList() async {
    try {
      List<PayeeModel> payeeList = await PayeeStorageService.getPayeeList();
      print('=== 本地存储的收款人列表 ===');
      print('总数: ${payeeList.length}');
      
      for (int i = 0; i < payeeList.length; i++) {
        PayeeModel payee = payeeList[i];
        print('第${i + 1}个收款人:');
        print('  户名: ${payee.name}');
        print('  账号: ${payee.account}');
        print('  银行: ${payee.bankName}');
        print('  网点: ${payee.branch ?? "未填写"}');
        print('  手机: ${payee.phone ?? "未填写"}');
        print('  别名: ${payee.alias ?? "未填写"}');
        print('  创建时间: ${payee.createdAt}');
        print('  JSON: ${payee.toJson()}');
        print('---');
      }
      print('=== 收款人列表结束 ===');
    } catch (e) {
      print('获取收款人列表失败: $e');
    }
  }
}

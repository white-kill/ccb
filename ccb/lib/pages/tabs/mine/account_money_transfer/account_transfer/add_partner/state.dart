import 'package:flutter/material.dart';

class AddPartnerState {
  // 表单控制器 - 直接初始化避免late初始化错误
  final TextEditingController nameController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController branchController = TextEditingController();

  Map? selectedBank;

  AddPartnerState() {
    ///Initialize variables
  }
  
  void dispose() {
    nameController.dispose();
    accountController.dispose();
    bankController.dispose();
    branchController.dispose();
    phoneController.dispose();
    aliasController.dispose();
  }
}

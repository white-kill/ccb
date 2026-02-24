import 'dart:convert';

import 'package:ccb/utils/sp_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ccb/utils/common_picker_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'state.dart';

class AccountSettingLogic extends GetxController {
  final state = AccountSettingState();

  // 新增：按钮是否可点击的状态
  final RxBool isButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 新增：为所有输入框添加监听器
    _addTextFieldListeners();
  }

  @override
  void onClose() {
    // 销毁所有控制器以防止内存泄漏
    state.residentialAddressController.dispose();
    state.residentialPostCodeController.dispose();
    state.residentialPhoneController.dispose();
    state.residentialTypeController.dispose();
    state.companyNameController.dispose();
    state.companyAddressController.dispose();
    state.companyPostCodeController.dispose();
    state.companyPhoneController.dispose();
    state.companyPhoneExtController.dispose();

    // 销毁三段式单位电话控制器
    state.companyPhoneFirstController.dispose();
    state.companyPhoneSecondController.dispose();
    state.companyPhoneThirdController.dispose();

    // 销毁两段式住宅电话控制器
    state.residentialPhoneAreaController.dispose();
    state.residentialPhoneNumberController.dispose();
    super.onClose();
  }

  // 新增：添加文本框监听器
  void _addTextFieldListeners() {
    state.residentialAddressController.addListener(validateForm);
    state.residentialPostCodeController.addListener(validateForm);
    state.residentialPhoneController.addListener(validateForm);
    state.residentialTypeController.addListener(validateForm);
    state.companyNameController.addListener(validateForm);
    state.companyAddressController.addListener(validateForm);
    state.companyPostCodeController.addListener(validateForm);
    state.companyPhoneController.addListener(validateForm);
    state.companyPhoneExtController.addListener(validateForm);


    // 添加三段式单位电话监听器
    state.companyPhoneFirstController.addListener(validateForm);
    state.companyPhoneSecondController.addListener(validateForm);
    state.companyPhoneThirdController.addListener(validateForm);

    // 添加两段式住宅电话监听器
    state.residentialPhoneAreaController.addListener(validateForm);
    state.residentialPhoneNumberController.addListener(validateForm);
  }

  // 新增：验证表单并更新按钮状态
  void validateForm() {
    bool isValid = true;

    // 检查必填字段
    // if (state.residentialAddressController.text.trim().isEmpty) {
    //   isValid = false;
    // }

    // 检查可选字段的格式
    // if (state.residentialPostCodeController.text.isNotEmpty) {
    //   if (validatePostCode(state.residentialPostCodeController.text) != null) {
    //     isValid = false;
    //   }
    // }
    //
    // if (state.companyPostCodeController.text.isNotEmpty) {
    //   if (validatePostCode(state.companyPostCodeController.text) != null) {
    //     isValid = false;
    //   }
    // }
    //
    // if (state.residentialPhoneController.text.isNotEmpty) {
    //   if (validateCall(state.residentialPhoneController.text) != null) {
    //     isValid = false;
    //   }
    // }
    //
    // if (state.companyPhoneController.text.isNotEmpty) {
    //   if (validatePhone(state.companyPhoneController.text) != null) {
    //     isValid = false;
    //   }
    // }

    isButtonEnabled.value = isValid;
  }

  // --- Validation Logic ---
  String? validateNotEmpty(String? value) {
    return null;
    if (value == null || value.isEmpty) {
      return '此项不能为空';
    }
    return null;
  }

  String? validatePostCode(String? value) {
    return null;

    if (value == null || value.isEmpty) return null; // 邮编为非必填
    // 使用正则表达式校验 6 位数字邮编
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return '请输入有效的 6 位邮政编码';
    }
    return null;
  }

  String? validateCall(String? value) {
    return null;

    if (value == null || value.isEmpty) return null; // 电话为非必填
    if (!GetUtils.isNum(value)) {
      return '请输入有效的电话号码';
    }
    return null;
  }

  String? validatePhone(String? value) {
    return null;

    if (value == null || value.isEmpty) return null; // 电话为非必填
    if (!GetUtils.isPhoneNumber(value)) {
      return '请输入有效的电话号码';
    }
    return null;
  }

  // 验证三段式电话号码
  String? validateThreeSegmentPhone(String? value) {
    return null;

    // 这里只是为了适配组件接口，实际验证在getCompletePhoneNumber中
    return null;
  }

  // 验证两段式电话号码
  String? validateTwoSegmentPhone(String? value) {
    // 这里只是为了适配组件接口，实际验证在getCompleteResidentialPhoneNumber中
    return null;
  }

  // 获取完整的三段式电话号码
  String getCompletePhoneNumber() {
    final first = state.companyPhoneFirstController.text.trim();
    final second = state.companyPhoneSecondController.text.trim();
    final third = state.companyPhoneThirdController.text.trim();

    if (first.isEmpty && second.isEmpty && third.isEmpty) {
      return '';
    }

    String result = '';
    if (first.isNotEmpty) {
      result += first;
    }
    if (second.isNotEmpty) {
      result += (result.isNotEmpty ? '-' : '') + second;
    }
    if (third.isNotEmpty) {
      result += (result.isNotEmpty ? '-' : '') + third;
    }

    return result;
  }

  // 获取完整的两段式住宅电话号码
  String getCompleteResidentialPhoneNumber() {
    final area = state.residentialPhoneAreaController.text.trim();
    final number = state.residentialPhoneNumberController.text.trim();

    if (area.isEmpty && number.isEmpty) {
      return '';
    }

    String result = '';
    if (area.isNotEmpty) {
      result += area;
    }
    if (number.isNotEmpty) {
      result += (result.isNotEmpty ? '-' : '') + number;
    }

    return result;
  }

  // 提交表单
  void submitForm() {
    if (state.formKey.currentState?.validate() ?? false) {
      // TODO: 在这里处理表单提交逻辑
      Get.snackbar(
        '成功',
        '信息更新成功',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        '提示',
        '请填写必填项',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // --- Picker/Navigation Logic ---
  void selectOption(String fieldName, RxString field, List<String> options) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: options
              .map((option) => ListTile(
                    title: Text(option),
                    onTap: () {
                      field.value = option;
                      Get.back();
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }

  void selectDate(String fieldName, RxString field) async {
    // DateTime? picked = await showDatePicker(
    //     context: Get.context!,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(1900),
    //     lastDate: DateTime(2101));
    // if (picked != null) {
    //   field.value = "${picked.year}-${picked.month}-${picked.day}";
    // }
  }

  void navigateToPage(String fieldName) {
    // Get.snackbar('跳转到', '处理 "$fieldName" 的专属页面');
  }

  // --- 具体字段操作 ---
  void editIdExpiryDate() => selectDate('证件有效期', state.idExpiryDate);
  void editMobileNumber() => navigateToPage('手机号码');
  void selectCountry() => navigateToPage('国家/地区');
  // 更新学历选择方法
  void selectEducation() {
    CommonPickerWidget(
      title: '学历',
      items: state.educationItems,
      selectedItem: state.educationItems.firstWhereOrNull(
          (element) => element.title == state.education.value),
      onItemSelected: (item) {
        state.education.value = item.title;
      },
    ).show();
    validateForm();
  }

  // 处理学历选择
  void onEducationSelected(CommonPickerItem item) {
    state.selectedEducation.value = item;
    state.education.value = item.title;
  }

  void selectMaritalStatus() {
    CommonPickerWidget(
      title: '婚姻状况',
      items: [
        CommonPickerItem(title: '未婚', value: '未婚'),
        CommonPickerItem(title: '已婚', value: '已婚'),
        CommonPickerItem(title: '离异', value: '离异'),
        CommonPickerItem(title: '其他', value: '其他'),
      ],
      selectedItem: CommonPickerItem(
          title: state.maritalStatus.value, value: state.maritalStatus.value),
      onItemSelected: (item) {
        state.maritalStatus.value = item.title;
      },
    ).show();
    validateForm();
  }

  void selectOccupation() => navigateToPage('职业');

  saveValue() async {
    // // 1. 校验必填字段
    // if (state.residentialAddressController.text.trim().isEmpty) {
    //   _showErrorDialog('住宅地址不能为空，请重新填写。');
    //   return;
    // }
    //
    // // 2. 校验邮编格式（如果已填写）
    // String residentialPostCode =
    //     state.residentialPostCodeController.text.trim();
    // if (residentialPostCode.isNotEmpty &&
    //     !RegExp(r'^\d{6}$').hasMatch(residentialPostCode)) {
    //   _showErrorDialog('住宅邮编格式不正确，请输入6位数字。');
    //   return;
    // }
    //
    // String companyPostCode = state.companyPostCodeController.text.trim();
    // if (companyPostCode.isNotEmpty &&
    //     !RegExp(r'^\d{6}$').hasMatch(companyPostCode)) {
    //   _showErrorDialog('单位邮编格式不正确，请输入6位数字。');
    //   return;
    // }
    //
    // // 3. 校验住宅电话（两段式）
    // String residentialPhoneArea =
    //     state.residentialPhoneAreaController.text.trim();
    // String residentialPhoneNumber =
    //     state.residentialPhoneNumberController.text.trim();
    //
    // if (residentialPhoneArea.isNotEmpty || residentialPhoneNumber.isNotEmpty) {
    //   if (residentialPhoneArea.isEmpty) {
    //     _showErrorDialog('住宅电话区号不能为空，请重新填写。');
    //     return;
    //   } else if (residentialPhoneArea.length != 4) {
    //     _showErrorDialog('住宅电话区号必须是4位数字，请重新填写。');
    //     return;
    //   }
    //
    //   if (residentialPhoneNumber.isEmpty) {
    //     _showErrorDialog('住宅电话信息不符合号码规则，请重新填写。');
    //     return;
    //   } else if (residentialPhoneNumber.length != 8) {
    //     _showErrorDialog('住宅电话号码必须是8位数字，请重新填写。');
    //     return;
    //   }
    // }
    //
    // // 4. 校验单位电话（三段式）
    // String companyPhoneFirst = state.companyPhoneFirstController.text.trim();
    // String companyPhoneSecond = state.companyPhoneSecondController.text.trim();
    // String companyPhoneThird = state.companyPhoneThirdController.text.trim();
    //
    // if (companyPhoneFirst.isNotEmpty ||
    //     companyPhoneSecond.isNotEmpty ||
    //     companyPhoneThird.isNotEmpty) {
    //   if (companyPhoneFirst.isEmpty) {
    //     _showErrorDialog('单位电话区号不能为空，请重新填写。');
    //     return;
    //   } else if (companyPhoneFirst.length != 4) {
    //     _showErrorDialog('客户电话信息不符合号码规则，请重新填写。');
    //     return;
    //   }
    //
    //   if (companyPhoneSecond.isEmpty) {
    //     _showErrorDialog('单位电话号码不符合号码规则，请重新填写。');
    //     return;
    //   } else if (companyPhoneSecond.length != 8) {
    //     _showErrorDialog('客户电话信息不符合号码规则，请重新填写。');
    //     return;
    //   }
    //
    //   // 分机号可选，但如果填写了必须是6位以内的数字
    //   if (companyPhoneThird.isNotEmpty &&
    //       (companyPhoneThird.length > 6 ||
    //           !RegExp(r'^\d+$').hasMatch(companyPhoneThird))) {
    //     _showErrorDialog('单位电话分机号必须是6位以内的数字，请重新填写。');
    //     return;
    //   }
    // }

    // 5. 校验通过，收集所有填写的信息（除了前面7个）
    Map<String, dynamic> filledData = {};

    // 从第8个开始收集信息

    // 9. 学历信息
    if (state.education.value.isNotEmpty) {
      filledData['学历'] = state.education.value;
    }

    // 10. 婚姻状况
    if (state.maritalStatus.value.isNotEmpty) {
      filledData['婚姻状况'] = state.maritalStatus.value;
    }

    // 11. 职业信息
    if (state.occupation.value.isNotEmpty) {
      filledData['职业'] = state.occupation.value;
    }

    // 19. 常住地址相关
    if (state.residentialAddressController.text.trim().isNotEmpty) {
      filledData['住宅地址'] = state.residentialAddressController.text.trim();
    }

    if (state.residentialTypeController.text.trim().isNotEmpty) {
      filledData['住宅性质'] = state.residentialTypeController.text.trim();
    }

    // 20. 工作信息相关
    if (state.companyNameController.text.trim().isNotEmpty) {
      filledData['单位名称'] = state.companyNameController.text.trim();
    }

    if (state.companyAddressController.text.trim().isNotEmpty) {
      filledData['单位地址'] = state.companyAddressController.text.trim();
    }

    if (state.companyPostCodeController.text.trim().isNotEmpty) {
      filledData['单位地址邮编'] = state.companyPostCodeController.text.trim();
    }

    // 21. 三段式单位电话详细信息
    String companyPhoneFirstStr = state.companyPhoneFirstController.text.trim();
    String companyPhoneSecondStr =
        state.companyPhoneSecondController.text.trim();
    String companyPhoneThirdStr = state.companyPhoneThirdController.text.trim();

    if (companyPhoneFirstStr.isNotEmpty) {
      filledData['单位电话区号'] = companyPhoneFirstStr;
    }
    if (companyPhoneSecondStr.isNotEmpty) {
      filledData['单位电话号码'] = companyPhoneSecondStr;
    }
    if (companyPhoneThirdStr.isNotEmpty) {
      filledData['单位电话分机号'] = companyPhoneThirdStr;
    }

// 添加缺少的住宅地址邮编
    String residentialPostCodeStr =
        state.residentialPostCodeController.text.trim();
    if (residentialPostCodeStr.isNotEmpty) {
      filledData['住宅地址邮编'] = residentialPostCodeStr;
    }

// 添加住宅电话（分段式存储）
    String residentialPhoneAreaStr =
        state.residentialPhoneAreaController.text.trim();
    String residentialPhoneNumberStr =
        state.residentialPhoneNumberController.text.trim();

    if (residentialPhoneAreaStr.isNotEmpty) {
      filledData['住宅电话区号'] = residentialPhoneAreaStr;
    }
    if (residentialPhoneNumberStr.isNotEmpty) {
      filledData['住宅电话号码'] = residentialPhoneNumberStr;
    }

    jsonEncode(filledData).saveUserInfo;
    isButtonEnabled.value = false;
    _showSuccessDialog("更新成功");
  }

  // 显示错误弹框的方法
  void _showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black87,
                  height: 1.4,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),
          ],
        ),
        actionsPadding: EdgeInsets.zero,
        actions: [
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(
                '确定',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  // 显示成功弹框的方法
  void _showSuccessDialog(String message) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black87,
                  height: 1.4,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade300),
          ],
        ),
        actionsPadding: EdgeInsets.zero,
        actions: [
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(
                '确定',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}

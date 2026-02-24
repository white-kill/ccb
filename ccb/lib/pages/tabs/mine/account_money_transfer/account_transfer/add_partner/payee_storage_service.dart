import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'payee_model.dart';

class PayeeStorageService {
  static const String _payeeListKey = 'payee_list';
  
  // 保存收款人到本地存储
  static Future<bool> savePayee(PayeeModel payee) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // 获取现有的收款人列表
      List<PayeeModel> payeeList = await getPayeeList();
      
      // 添加新的收款人到列表
      payeeList.add(payee);
      
      // 转换为JSON字符串列表
      List<String> jsonStringList = payeeList
          .map((payee) => json.encode(payee.toJson()))
          .toList();
      
      // 保存到SharedPreferences
      bool result = await prefs.setStringList(_payeeListKey, jsonStringList);
      
      if (result) {
        print('收款人保存成功: ${payee.toString()}');
        print('当前收款人列表数量: ${payeeList.length}');
      }
      
      return result;
    } catch (e) {
      print('保存收款人失败: $e');
      return false;
    }
  }
  
  // 获取所有收款人列表
  static Future<List<PayeeModel>> getPayeeList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // 获取JSON字符串列表
      List<String>? jsonStringList = prefs.getStringList(_payeeListKey);
      
      if (jsonStringList == null || jsonStringList.isEmpty) {
        return [];
      }
      
      // 转换为PayeeModel列表
      List<PayeeModel> payeeList = jsonStringList
          .map((jsonString) {
            try {
              Map<String, dynamic> jsonMap = json.decode(jsonString);
              return PayeeModel.fromJson(jsonMap);
            } catch (e) {
              print('解析收款人数据失败: $e');
              return null;
            }
          })
          .where((payee) => payee != null)
          .cast<PayeeModel>()
          .toList();
      
      return payeeList;
    } catch (e) {
      print('获取收款人列表失败: $e');
      return [];
    }
  }
  
  // 删除指定收款人
  static Future<bool> deletePayee(int index) async {
    try {
      List<PayeeModel> payeeList = await getPayeeList();
      
      if (index < 0 || index >= payeeList.length) {
        return false;
      }
      
      payeeList.removeAt(index);
      
      final prefs = await SharedPreferences.getInstance();
      List<String> jsonStringList = payeeList
          .map((payee) => json.encode(payee.toJson()))
          .toList();
      
      return await prefs.setStringList(_payeeListKey, jsonStringList);
    } catch (e) {
      print('删除收款人失败: $e');
      return false;
    }
  }
  
  // 清空所有收款人
  static Future<bool> clearAllPayees() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_payeeListKey);
    } catch (e) {
      print('清空收款人列表失败: $e');
      return false;
    }
  }
  
  // 获取收款人数量
  static Future<int> getPayeeCount() async {
    List<PayeeModel> payeeList = await getPayeeList();
    return payeeList.length;
  }
}

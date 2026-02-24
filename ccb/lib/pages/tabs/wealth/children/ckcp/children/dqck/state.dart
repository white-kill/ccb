import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DqckState {
  final List<String> tabTitles = ['整存整取', '零存整取', '定活两便'];
  final List<String> tabImages = [
    'assets/new_images/cai_fu/children/dqck/dqck_1.png',
    'assets/new_images/cai_fu/children/dqck/dqck_2.png',
    'assets/new_images/cai_fu/children/dqck/dqck_3.png',
  ];

  // 利率说明数据
  final List<List<Widget>> _rateDescriptions = [
    // 整存整取
    [
      Text(
        '三个月：1.35%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '半年：1.55%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '一年：1.75%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '二年：2.15%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '三年：2.75%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
    ],
    // 零存整取
    [
      Text(
        '一年：1.85%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '三年：2.85%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '五年：3.15%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
    ],
    // 定活两便
    [
      Text(
        '活期利率：0.30%',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '定期利率：1.75%（一年）',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
    ],
  ];

  // 计息规则数据
  final List<List<Widget>> _interestRules = [
    // 整存整取
    [
      Text(
        '1. 存款期限固定，到期一次性支取本息',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '2. 提前支取按活期利率计息',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '3. 到期自动转存',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
    ],
    // 零存整取
    [
      Text(
        '1. 按月定额存款，到期一次性支取本息',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '2. 中途停存或提前支取按活期利率计息',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '3. 可设置自动转账',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
    ],
    // 定活两便
    [
      Text(
        '1. 存取灵活，可随时支取',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '2. 支取时按实际存期计算利息',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
      SizedBox(height: 8.w),
      Text(
        '3. 存满一年按定期利率计息',
        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      ),
    ],
  ];

  // 获取利率说明
  List<Widget> getRateDescription(int index) {
    return _rateDescriptions[index];
  }

  // 获取计息规则
  List<Widget> getInterestRules(int index) {
    return _interestRules[index];
  }

  DqckState() {
    // Initialize variables
  }
} 
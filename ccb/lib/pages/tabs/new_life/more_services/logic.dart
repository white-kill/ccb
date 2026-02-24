import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreServicesLogic extends GetxController {
  final List<String> tabs = [
    "政务服务",
    "生活缴费",
    "便民服务",
    "美食娱乐",
    "车主服务",
    "医疗健康",
    "商旅服务",
    "学校教育",
    "党团工会"
  ];
  var selectedTabIndex = 0.obs;

  final ScrollController scrollController = ScrollController();
  final zhengWuFuWuKey = GlobalKey();
  final shengHuoJiaoFeiKey = GlobalKey();
  final bianMinFuWuKey = GlobalKey();
  final meiShiYuLeKey = GlobalKey();
  final cheZhuFuWuKey = GlobalKey();
  final yiLiaoJianKangKey = GlobalKey();
  final shangLvFuWuKey = GlobalKey();
  final xueXiaoJiaoYuKey = GlobalKey();
  final dangTuanGongHuiKey = GlobalKey();

  late List<GlobalKey> sectionKeys;

  @override
  void onInit() {
    super.onInit();
    sectionKeys = [
      zhengWuFuWuKey,
      shengHuoJiaoFeiKey,
      bianMinFuWuKey,
      meiShiYuLeKey,
      cheZhuFuWuKey,
      yiLiaoJianKangKey,
      shangLvFuWuKey,
      xueXiaoJiaoYuKey,
      dangTuanGongHuiKey,
    ];
  }

  void scrollToSection(int index) {
    selectedTabIndex.value = index;
    Scrollable.ensureVisible(
      sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
} 
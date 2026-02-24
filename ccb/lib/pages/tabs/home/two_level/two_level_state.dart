import 'package:flutter/material.dart';

class TwoLevelState {
  late PageController pageController;
  int currentPage = 0;
  
  // 控制全屏图片显示
  bool showFullImage = false;
  String fullImageName = '';
  
  // 控制总资产显示/隐藏
  bool showBalance = false;

  TwoLevelState() {
    ///Initialize variables
    pageController = PageController(initialPage: 0);
  }

  void dispose() {
    pageController.dispose();
  }
}


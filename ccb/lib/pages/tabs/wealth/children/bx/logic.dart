import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';

class BaoXianMainLogic extends GetxController {
  final BaoXianMainState state = BaoXianMainState();
  
  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
} 
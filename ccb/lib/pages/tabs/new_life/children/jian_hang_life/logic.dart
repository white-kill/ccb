import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JianHangLifeLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // Show dialog when the page is ready
    Get.dialog(
      AlertDialog(
        content: const Text(
          '如您未安装建行生活APP, 请前往应用市场下载',
          textAlign: TextAlign.start,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('取消', style: TextStyle(
                color: Color(0xFF000002)
            ),),
            onPressed: () {
              Get.back(); // Close the dialog
              Get.back();
            },
          ),
          TextButton(
            child: Text('确定', style: TextStyle(
              color: Color(0xFFF96200)
            ),),
            onPressed: () {
              // Add logic for redirection to app store
              Get.back(); // Close the dialog
              Get.back();
            },
          ),
        ],
      ),
    );
  }
} 
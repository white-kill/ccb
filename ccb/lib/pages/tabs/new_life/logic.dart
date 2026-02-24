import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class NewLifeLogic extends GetxController {
  final NewLifeState state = NewLifeState();

  var bottomIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bottomIndex.value = 1;
      Future.delayed(Duration(milliseconds: 200), () {
        bottomIndex.value = 0;
      });
    });

  }

}

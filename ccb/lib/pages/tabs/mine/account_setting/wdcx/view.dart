import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WdcxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WdcxLogic());

    return InkWell(
        onTap: () {
          Get.back();
        },
        child: Image(image: AssetImage('assets/new_images/mine/children/wdcx.png'), width: screenWidth, fit: BoxFit.fitWidth,));
  }
}

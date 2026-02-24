import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ZFWDDKPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ZFWDDKLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/new_images/home/children/zf_wddk.png',
              width: screenWidth,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
                top: 0,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: screenWidth,
                    height: navigateHeight,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

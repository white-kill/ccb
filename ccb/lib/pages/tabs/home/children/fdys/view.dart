import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'logic.dart';

class FangDaiYuShenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(FangDaiYuShenLogic());

    return Container(
      child: Stack(
        children: [
          Image.asset(
            'assets/new_images/home/children/fdys.png',
            width: MediaQuery.of(context).size.width,
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
          Positioned(
              top: screenWidth/3240 * 7125 * 0.55,
              left: screenWidth * 0.12,
              child: InkWell(
                onTap: () {
                  Get.offNamed(Routes.saoyisaoPage);
                },
                child: Container(
                  width: screenWidth * 0.34,
                  height: screenWidth/3240 * 7125 * 0.05,
                ),
              )),
          Positioned(
              top: screenWidth/3240 * 7125 * 0.55,
              left: screenWidth * 0.12 + screenWidth * 0.34,
              child: InkWell(
                onTap: () {
                  Get.offNamed(Routes.fixedNavPage, arguments: {
                    'title': '房贷预审',
                    'fullImagePath': 'home/children/fdys_zjsq.jpg'.newImgPath,
                  });
                },
                child: Container(
                  width: screenWidth * 0.34,
                  height: screenWidth/3240 * 7125 * 0.05,
                ),
              )),
        ],
      ),
    );
  }
}

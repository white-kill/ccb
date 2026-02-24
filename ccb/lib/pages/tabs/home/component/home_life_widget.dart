import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../../routes/app_pages.dart';

class HomeLifeWidget extends StatefulWidget {
  const HomeLifeWidget({super.key});

  @override
  State<HomeLifeWidget> createState() => _HomeLifeWidgetState();
}

class _HomeLifeWidgetState extends State<HomeLifeWidget> {
  @override
  Widget build(BuildContext context) {
    return _containerBg(
      width: 350.w,
      height: 232.w,
      imagePath: 'bg_home_life',
      child: Container(
        padding: EdgeInsets.only(top: 45.w,bottom: 10.w),
        child: Row(
          children: [
            Expanded(child: Container().withOnTap(onTap: (){
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '主会场',
                'image': 'cfhd_1',
              });
            })),

            Expanded(child: Column(
              children: [
                Expanded(child: Container().withOnTap(onTap: (){
                  Get.toNamed(Routes.changeNavPage, arguments: {
                    'title': '',
                    'image': 'honme_hsq',
                  });
                })),
                Expanded(child: Container().withOnTap(onTap: (){
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '善融一元购 好物1元尝鲜',
                    'image': 'home_1y',
                    'rightItem':"1"
                  });
                })),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xffF2FBFD),
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}

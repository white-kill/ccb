import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../../routes/app_pages.dart';

class HomeYangLaoWidget extends StatefulWidget {
  const HomeYangLaoWidget({super.key});

  @override
  State<HomeYangLaoWidget> createState() => _HomeYangLaoWidgetState();
}

class _HomeYangLaoWidgetState extends State<HomeYangLaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.w, left: 0.w, right: 0.w),
      child: _containerBg(
          width: 350.w,
          height: 232.w,
          imagePath: 'bg_home_yanglao',
          child: Container(
            margin: EdgeInsets.only(top: 55.w,bottom: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Container().withOnTap(onTap: () {
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '个人养老金',
                      'image': 'bg_grylj',
                    });
                  }),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                          ).withOnTap(onTap: (){
                            // axyxgrylzq_1@3x
                            Get.toNamed(Routes.changeNavPage, arguments: {
                              'title': '安心享个人养老专区',
                              'image': 'axyxgrylzq_1',
                            });
                          }),
                        ),
                        Expanded(
                          child: Container(
                          ).withOnTap(onTap: (){
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '养老资讯',
                              'image': 'ylzx_1',
                            });
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
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
        // borderRadius: BorderRadius.circular(12.w),
        // boxShadow: [
        //   BoxShadow(
        //     color: const Color(0xffF6FCFF).withOpacity(0.2),
        //     blurRadius: 12,
        //     spreadRadius: 0.5,
        //     offset: const Offset(0, 1),
        //   ),
        // ],
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}

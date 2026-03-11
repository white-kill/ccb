import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import 'function_banner_widget.dart';

class TopBannerWidget extends StatefulWidget {
  const TopBannerWidget({super.key});

  @override
  State<TopBannerWidget> createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends State<TopBannerWidget> {
  List<String> nameList = ['账户总览', '转账汇款', '贷款', '扫一扫'];

  void jumpPage(String name) {
    if (name == '账户总览') {
      Get.toNamed(Routes.accountPreview);
    }

    if (name == '转账汇款') {
      Get.toNamed(
        Routes.accountMoneyTransferView,
      );
    }

    if (name == '贷款') {
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '借钱',
        'image': 'bg_jq',
      });
    }
    if (name == '扫一扫') {
      //Get.toNamed(Routes.homeScanPage);
      Get.toNamed(Routes.saoyisaoPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 1080, designHeight: 1041, deviceWidth: 1.sw);
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenWidth / 1080 * 1041,
          alignment: Alignment.topCenter,
          child: Image(image: 'new_home_top'.png3x, fit: BoxFit.fitWidth, width: 1.sw,)
        ),
        Positioned(child: Container(
          margin: EdgeInsets.only(top: screenWidth / 1080 * 200,),
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.w),
          child: VerticalGridView(
            widgetBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: 'ic_top_tag${index + 1}'.png3x,
                    width: 30.w,
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  BaseText(
                    text: nameList[index],
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.8),
                        fontFamily: 'PingFangSC',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2),
                  ),
                ],
              ).withOnTap(onTap: () => jumpPage(nameList[index]));
            },
            mainHeight: 93.w,
            itemCount: 4,
          ),
        )),
        Positioned(
            top: position.getY(530),
            child: FunctionBannerWidget()),
      ],
    );


    // return VerticalGridView(
    //   widgetBuilder: (BuildContext context, int index) {
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Image(
    //           image: 'ic_top_tag${index + 1}'.png3x,
    //           width: 30.w,
    //           height: 30.h,
    //         ),
    //         SizedBox(
    //           height: 4.w,
    //         ),
    //         BaseText(
    //           text: nameList[index],
    //           style: TextStyle(
    //               fontSize: 12.sp,
    //               color: Colors.white,
    //               fontFamily: 'PingFangSC',
    //               fontWeight: FontWeight.w500,
    //               letterSpacing: 0.2),
    //         ),
    //       ],
    //     ).withOnTap(onTap: () => jumpPage(nameList[index]));
    //   },
    //   mainHeight: 93.w,
    //   itemCount: 4,
    // )
    //     .withContainer(
    //       width: screenWidth,
    //       height: screenWidth / 1080 * 520,
    //       alignment: Alignment.bottomCenter,
    //       padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.w),
    //       // padding: EdgeInsets.symmetric(horizontal: 24.sp),
    //       // decoration: BoxDecoration(
    //       //   image: DecorationImage(
    //       //     image: 'bg_home_banner'.png3x,
    //       //     fit: BoxFit.fitWidth,
    //       //   ),
    //       // color: Colors.white.withOpacity(0.6),
    //       // borderRadius: BorderRadius.circular(12.w),
    //       // boxShadow: [
    //       //   BoxShadow(
    //       //     color: Colors.white.withOpacity(0.2),
    //       //     blurRadius: 12,
    //       //     spreadRadius: 0.5,
    //       //     offset: const Offset(0, 1),
    //       //   ),
    //       // ],
    //       // ),
    //     )
    //     .withContainer(
    //       width: screenWidth,
    //       height: screenWidth / 1080 * 1041,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: 'new_home_top'.png3x,
    //           fit: BoxFit.fitWidth,
    //
    //         ),
    //       ),
    //       alignment: Alignment.topCenter,
    //       padding: EdgeInsets.only(bottom: 10.w),
    //     );
  }
}

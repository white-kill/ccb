import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'logic.dart';
import 'state.dart';

class ScanCardPage extends StatelessWidget {
  ScanCardPage({Key? key}) : super(key: key);

  final ScanCardLogic logic = Get.put(ScanCardLogic());
  final ScanCardState state = Get.find<ScanCardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanCardLogic>(builder: (logic) {
        return Stack(
          children: [
            // 全屏相机预览
            logic.controller.value.isInitialized
                ? SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: logic.controller.value.previewSize!.height,
                        height: logic.controller.value.previewSize!.width,
                        child: CameraPreview(logic.controller),
                      ),
                    ),
                  )
                : Container(
                    width: 1.sw,
                    height: 1.sh,
                    color: Colors.black,
                  ),
            // 返回按钮
            Positioned(
              top: MediaQuery.of(context).padding.top + 10.h,
              left: 15.w,
              width: 1.sw,
              child: SafeArea(
                top: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image(
                            width: 33.w,
                            height: 33.w,
                            image: ('go_back').png3x,
                            color: Colors.white)
                        .withOnTap(onTap: () {
                      //返回
                      Get.back();
                    }),
                    Text(
                      "请扫描银行卡",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                    SizedBox(
                      width: 33.w,
                      height: 33.w,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                child: Center(
              child: Image(image: 'scan_card_center'.png),
            )),
            // 动画扫描线
            if (logic.isAnimationReady)
              Positioned(
                child: Center(
                  child: AnimatedBuilder(
                    animation: logic.scanAnimation!,
                    builder: (context, child) {
                      return Container(
                        width: 1.sw,
                        height: 200.w,
                        child: Stack(
                          children: [
                            Positioned(
                              top: logic.scanAnimation!.value * 195.w,
                              left: 10.w,
                              right: 10.w,
                              child: Container(
                                height: 2.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Color(0xFF00E5CC).withOpacity(0.6),
                                      Color(0xFF00E5CC),
                                      Color(0xFF00E5CC).withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                    stops: [0.0, 0.1, 0.5, 0.9, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(5.w),
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: Color(0xFF00E5CC).withOpacity(0.3),
                                    //   blurRadius: 0.w,
                                    //   spreadRadius: 1.w,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            Positioned(
                child: Center(
              child: Container(
                  padding: EdgeInsets.only(bottom: 90.w),
                  child: Text(
                    "请将银行卡置于框内",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontFamily: "PingFang"),
                  )),
            )),
            Positioned(
                child: Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 320.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(image: 'scan_card_light'.png, width: 18.w,),
                          SizedBox(height: 5.w,),

                          Text(
                            "手电筒",
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.white,
                                fontFamily: "PingFang"),
                          )
                        ],
                      )),
                )),
            Positioned(
              left: 20.w,
                bottom: 20.w,
                child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(image: 'scan_card_photo'.png, width: 35.w,),
                        SizedBox(height: 5.w,),
                        Text(
                          "图像导入",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.white,
                              fontFamily: "PingFang"),
                        )
                      ],
                    )),)
          ],
        );
      }),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
          alignment: Alignment.center,
          children: [
            Container(
              width: 1.sw,
              height: 1.sw,
              color: Colors.white,
            ),
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
            // 镂空覆盖层
            Positioned(
              top: 0,
              left: 0,
              child: CustomPaint(
                size: Size(1.sw, 1.sh),
                painter: HolePainter(
                  opacity: 0.5,
                  borderRadius: 0,
                  holeWidth: 0.93.sw,
                  holeHeight: 1804/3123 * 1.sw,
                  topMargin: ((1.sh - (2127/3123 * 1.sw))/2.0) + ((1804/3123 * 1.sw)*0.15),
                  leftMargin: 0.041.sw,
                ),
              ),
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
                            width: 30.w,
                            height: 30.w,
                            image: ('scan_back').png,
                            )
                        .withOnTap(onTap: () {
                      //返回
                      Get.back();
                    }),

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
              child: Image(image: 'scan_center'.png),
            )),
            Positioned(
              bottom: 20.w,
                child:Container(
                    // padding: EdgeInsets.only(bottom: 20.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(image: 'scan_flash'.png, width: 18.w,),
                        SizedBox(height: 5.w,),

                        Text(
                          "手电筒",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.white,
                              fontFamily: "PingFang"),
                        )
                      ],
                    ))),
          ],
        );
      }),
    );
  }
}

// 自定义画笔，用于绘制镂空效果
class HolePainter extends CustomPainter {
  final double holeWidth;
  final double holeHeight;
  final double topMargin;
  final double leftMargin;
  final double borderRadius;
  final Color overlayColor;
  final double opacity;

  const HolePainter({
    required this.holeWidth,
    required this.holeHeight,
    required this.topMargin,
    required this.leftMargin,
    this.borderRadius = 12,
    this.overlayColor = Colors.black,
    this.opacity = 0.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = overlayColor.withOpacity(opacity)
      ..style = PaintingStyle.fill;
    
    // 创建外部路径（整个画布）
    final outerPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    
    // 创建内部路径（镂空区域）
    final innerPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(leftMargin, topMargin, holeWidth, holeHeight),
        Radius.circular(borderRadius.r),
      ));
    
    // 使用Path.difference创建镂空效果
    final combinedPath = Path.combine(
      PathOperation.difference,
      outerPath,
      innerPath,
    );
    
    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(covariant HolePainter oldDelegate) {
    return oldDelegate.holeWidth != holeWidth ||
        oldDelegate.holeHeight != holeHeight ||
        oldDelegate.topMargin != topMargin ||
        oldDelegate.leftMargin != leftMargin ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.overlayColor != overlayColor ||
        oldDelegate.opacity != opacity;
  }
}

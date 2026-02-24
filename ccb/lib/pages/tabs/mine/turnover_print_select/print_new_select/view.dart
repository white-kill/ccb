import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class PrintNewSelectPage extends BaseStateless {
  PrintNewSelectPage({Key? key}) : super(key: key, title: "流水打印");

  final PrintNewSelectLogic logic = Get.put(PrintNewSelectLogic());
  final PrintNewSelectState state = Get.find<PrintNewSelectLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Widget? get leftItem => SizedBox();

  @override
  List<Widget>? get rightAction => [
        Container(
          width: 85.w,
          height: 32.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'ic_min_right'.png3x,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container().withOnTap(onTap: () {
                BaseBottomSheet.sheetContentWidget(
                    bgColor: const Color.fromARGB(255, 240, 240, 240),
                    topWidget: Image(
                      image: 'ic_jhdj_left1'.png3x,
                    ).withPadding(left: 12.w, right: 12.w).withContainer(
                          height: 68.w,
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 1.sw,
                          height: 0.5.w,
                          color: const Color.fromARGB(255, 235, 235, 235),
                        ),
                        Image(
                          image: 'ic_jhdj_left2'.png3x,
                        ).withPadding(left: 12.w, right: 12.w),
                        Container(
                          height: 42.w,
                          alignment: Alignment.center,
                          child: BaseText(
                            text: "取消",
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ).withOnTap(onTap: () {
                          Get.back();
                        }),
                      ],
                    ));
                // Get
              })),
              Expanded(
                  child: Container().withOnTap(onTap: () {
                Get.offAllNamed(Routes.tabs);
              })),
            ],
          ),
        ).withPadding(right: 10.w),
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Stack(
          children: [
            Image(
              image: "print_select_new".png,
              fit: BoxFit.fitWidth,
              width: 1.sw,
            ),
            Positioned(
                left: 0,
                top: 10.w,
                child: Container(
                  width: 1.sw,
                  height: 55.w,
                ).withOnTap(onTap: () {
                  Get.toNamed(Routes.realturnoverPrintSelectPage,
                      arguments: {"type": "online"});
                })),
            Positioned(
                left: 0,
                top: 85.w,
                child: Container(
                  width: 1.sw,
                  height: 55.w,
                ).withOnTap(onTap: () {
                  Get.toNamed(Routes.realturnoverPrintSelectPage,
                      arguments: {"type": "paper"});
                })),
            Positioned(
                left: 0,
                top: 155.w,
                child: Container(
                  width: 1.sw,
                  height: 20.w,
                ).withOnTap(onTap: () {
                  Get.offAndToNamed(Routes.printProgressPage);
                }))
          ],
        )
      ],
    );
  }
}

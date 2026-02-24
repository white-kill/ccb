import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'banlixuzhi_logic.dart';
import 'banlixuzhi_state.dart';

class BanlixuzhiPage extends BaseStateless {
  BanlixuzhiPage({Key? key}) : super(key: key,title: '办理须知');

  final BanlixuzhiLogic logic = Get.put(BanlixuzhiLogic());
  final BanlixuzhiState state = Get.find<BanlixuzhiLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

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
      children: [
        Image(image: 'xz'.png3x),
      ],
    );
  }
}

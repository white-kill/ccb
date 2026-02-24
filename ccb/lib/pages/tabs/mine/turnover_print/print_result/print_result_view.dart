import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'print_result_logic.dart';
import 'print_result_state.dart';

class PrintResultPage extends BaseStateless {
  PrintResultPage({super.key}) : super(title: '流水打印');

  final PrintResultLogic logic = Get.put(PrintResultLogic());
  final PrintResultState state = Get.find<PrintResultLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Widget? get leftItem => Container();

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
  Color? get background => Color(0xFFF7F7F7);

  @override
  Widget initBody(BuildContext context) {
    // ic_print_result
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 25.w,
        ),
        Image(
          image: 'ic_print_result'.png3x,
          width: 60.w,
          height: 60.w,
        ),
        BaseText(
          text: '申请提交成功！',
          fontSize: 15.sp,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "PingFangSC"),
        ).withContainer(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20.w, bottom: 12.w)),
        Text(
          "我行尽快处理您的申请,将于24小时内把加密后的账户交易明细文件发送至您指定的邮箱，请注意查收邮件。您可通过“建行到家-进度查询”查看发送状态和解压密码。",
          style: TextStyle(
              color: const Color(0xff747474), fontSize: 14.sp, height: 1.7),
        ),
        // BaseText(
        //   text: '我行尽快处理您的申请，'
        //       '将于24小时内把加密后的账户交易 明细文件发送至您指定的邮箱，'
        //       '请注意查收邮件。'
        //       '您可通过“建行到家-进度查询"查看发送状态和提取密码。',
        //   color: const Color(0xff666666),
        //   maxLines: 10,
        //   fontSize: 12.sp,
        // ),

        SizedBox(
          height: 25.w,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.w)),
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return (state.keyList[index] == '')
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          Container(
                            height: 45.w,
                            padding: EdgeInsets.only(left: 16.w, right: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BaseText(text: state.keyList[index], color: Color(0xFF2C2C2E),)
                                    .withContainer(width: 110.w),
                                BaseText(
                                  text: state.valueList[index],
                                  color: Color(0xFF6F6F6F),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16.w, right: 16.w),
                            width: 1.sw,
                            height: 0.5.w,
                            color: const Color(0xffdedede),
                          )
                        ],
                      );
              },
              itemCount: state.keyList.length),
        ),
        SizedBox(height: 25.w),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 36.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.w)),
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFF707070),
                    width: 1.w,
                  ),
                ),
                child: BaseText(
                  text: '进度查询',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ).withOnTap(
                onTap: () {
                  Get.offAndToNamed(Routes.printProgressPage);
                },
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            // Expanded(
            //   child: Container(
            //     height: 36.w,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(50.w)),
            //       border: Border.all(
            //         color: Colors.black,
            //         width: 1.w,
            //       ),
            //     ),
            //     child: BaseText(
            //       text: '继续申请',
            //       fontSize: 13.sp,
            //     ),
            //   ).withOnTap(
            //     onTap: () {
            //       Get.back();
            //     },
            //   ),
            // ),
            // SizedBox(
            //   width: 12.w,
            // ),
            Expanded(
              child: Container(
                height: 36.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.w),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff4A6FCD),
                          Color(0xff81AEF4),
                        ])),
                child: BaseText(
                  text: '继续申请',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.white,
                  ),
                ),
              ).withOnTap(
                onTap: () {
                  Get.back();
                  // Get.offAndToNamed(Routes.ccbHomePage);
                },
              ),
            ),
          ],
        ),
      ],
    ).withContainer(
        // color: Colors.white,
        padding: EdgeInsets.only(left: 16.w, right: 16.w));
  }
}

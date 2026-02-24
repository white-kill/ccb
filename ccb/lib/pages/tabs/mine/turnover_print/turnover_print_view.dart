import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import 'component/print_item1_widget.dart';
import 'component/print_item2_widget.dart';
import 'component/print_item3_widget.dart';
import 'component/print_item4_widget.dart';
import 'component/print_item5_widget.dart';
import 'turnover_print_logic.dart';
import 'turnover_print_state.dart';

class TurnoverPrintPage extends BaseStateless {
  TurnoverPrintPage({Key? key}) : super(key: key, title: '流水打印');

  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());
  final TurnoverPrintState state = Get.find<TurnoverPrintLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Widget? get leftItem => Get.arguments?['isBack'] == true
      ? super.leftItem
      : Image(
          image: 'ic_left_back_home'.png3x,
          width: 42.w,
          height: 30.w,
        )
          .withPadding(left: 10.w)
          .withOnTap(onTap: () => Get.offAndToNamed(Routes.ccbHomePage));

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
                // Get.offNamedUntil(Routes.turnoverPrintSelectPage,
                //     ModalRoute.withName(Routes.tabs));
              })),
            ],
          ),
        ).withPadding(right: 10.w),
      ];

  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return Obx(() => logic.showPage.value
        ? ListView(
            padding: EdgeInsets.zero,
            children: [
              const PrintItem1Widget(),
              const PrintItem2Widget(),
              const PrintItem3Widget(),
              const PrintItem4Widget(),
              // const PrintItem5Widget(),

              Container(
                width: 350.w,
                height: 94.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
                padding: EdgeInsets.only(left: 12.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BaseText(text: '服务人员代码').withContainer(width: 110.w),
                        const TextFieldWidget(
                          hintText: '选填',
                        ).withContainer(width: 200.w),
                      ],
                    ),
                    Container(
                      width: 1.sw,
                      height: 0.5.w,
                      color: const Color(0xffdedede),
                    ),
                    Row(
                      children: [
                        BaseText(text: '服务机构代码').withContainer(width: 110.w),
                        const TextFieldWidget(
                          hintText: '选填',
                        ).withContainer(width: 200.w),
                      ],
                    ),
                  ],
                )
              ),



              // BaseText(
              //   text: '温馨提示：',
              //   fontSize: 12.sp,
              //   color: const Color(0xff363636),
              // ).withContainer(
              //     padding: EdgeInsets.only(left: 22.w, top: 2.w, bottom: 20.w)),
              // Container(
              //   padding: EdgeInsets.only(left: 26.w, right: 26.w, bottom: 18.w),
              //   child: Column(
              //     children: [
              //       Text(
              //         "•   每名客户每日在我行线上各渠道累计可申请20次，超出次数限制请次日再申请。",
              //         style: TextStyle(
              //             fontSize: 13.sp,
              //             color: const Color(0xffA2A2A2),
              //             height: 1.5),
              //       ),
              //       SizedBox(
              //         height: 3.w,
              //       ),
              //       Text(
              //         "•   领取方式含电子邮件、邮寄到家、在线查看、"
              //             "网点刷码打印。电子邮件、"
              //             "在线查看、"
              //             "网点刷码打印支持查询十五年内交易明细，邮寄到家方式支持查询五年内交易明细。"
              //             "各地区支持的领取方式存在差异，请以各地实际为准。",
              //         style: TextStyle(
              //             fontSize: 13.sp,
              //             color: const Color(0xffA2A2A2),
              //             height: 1.5),
              //       ),
              //       SizedBox(
              //         height: 3.w,
              //       ),
              //       Text(
              //         "•   工作日16:00以后和非工作日暂无法处理您提交的邮寄到家业务，我们将在下个工作日尽快为您处理并寄送。",
              //         style: TextStyle(
              //             fontSize: 13.sp,
              //             color: const Color(0xffA2A2A2),
              //             height: 1.5),
              //       ),
              //       Text(
              //         "•   快递收费标准存在地区差异,实际收费请以所选地区为准。",
              //         style: TextStyle(
              //             fontSize: 13.sp,
              //             color: const Color(0xffA2A2A2),
              //             height: 1.5),
              //       ),
              //       Text(
              //         "•   如您申请电子邮件服务，在收到邮件进行文件解压时需使用winrar、winzip、7zip等压缩工具进行解压操作。",
              //         style: TextStyle(
              //             fontSize: 13.sp,
              //             color: const Color(0xffA2A2A2),
              //             height: 1.5),
              //       ),
              //     ],
              //   ),
              // ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(
              //       children: [
              //         Obx(() => Icon(
              //                     logic.agree.value
              //                         ? Icons.check_box_rounded
              //                         : Icons.check_box_outline_blank,
              //                     size: 16.w,
              //                     color: logic.agree.value
              //                         ? const Color(0xff283CB1)
              //                         : Color(0xffA2A2A2))
              //                 .withOnTap(onTap: () {
              //               logic.agree.value = !logic.agree.value;
              //               logic.update(['updateBottom']);
              //             })),
              //         BaseText(
              //           text: ' 我已阅读并知晓',
              //           fontSize: 12.sp,
              //           color: const Color(0xffA2A2A2),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       height: 5.w,
              //     ),
              //     BaseText(
              //       text: '《流水打印业务办理须知》',
              //       color: Color(0xff4859BB),
              //       fontSize: 12.sp,
              //     ).withOnTap(onTap: () {
              //       Get.toNamed(Routes.fixedNavPage, arguments: {
              //         'title': '办理须知',
              //         'image': 'blxz',
              //       });
              //     })
              //   ],
              // ).withContainer(
              //     width: 350.w,
              //     padding: EdgeInsets.only(
              //       left: 26.w,
              //       right: 26.w,
              //     )),
              GetBuilder(
                builder: (TurnoverPrintLogic c) {
                  return Container(
                    width: 350.w,
                    height: 42.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: logic.agree.value ? null : const Color(0xffC5D9F8),
                      gradient: logic.agree.value
                          ? const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff3768CB),
                                Color(0xff6FACF9)
                              ], // 渐变色列表
                            )
                          : null,
                      borderRadius: BorderRadius.all(Radius.circular(6.w)),
                    ),
                    margin: EdgeInsets.only(
                        left: 12.w,
                        right: 12.w,
                        top: 10.w,
                        bottom: ScreenUtil().bottomBarHeight + 10.w),
                    child: BaseText(
                      text: "下一步",
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ).withOnTap(onTap: () {
                    logic.next();
                  });
                },
                id: 'updateBottom',
              )
            ],
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.white,
            padding: EdgeInsets.only(bottom: navHeight / 2.w),
            child:
            // !logic.showImage.value
            //     ?
        const SizedBox.shrink()
                // : Image(
                //     image: 'ic_cbb_loading'.png3x,
                //     width: 70.w,
                //     height: 70.w,
                //   ),
          ));
  }
}

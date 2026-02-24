import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/component/count_down_btn.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'print_info_logic.dart';
import 'print_info_state.dart';

class PrintInfoPage extends BaseStateless {
  PrintInfoPage({Key? key}) : super(key: key, title: '流水打印');

  final PrintInfoLogic logic = Get.put(PrintInfoLogic());
  final PrintInfoState state = Get.find<PrintInfoLogic>().state;

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
    return Column(
      children: [
        Expanded(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return (state.valueList[index] == '' ||
                              state.keyList[index] == '')
                          ? const SizedBox.shrink()
                          : Container(
                              height: 45.w,
                              padding: EdgeInsets.only(left: 16.w, right: 16.w),
                              child: Row(
                                      children: [
                                        BaseText(text: state.keyList[index])
                                            .withContainer(width: 110.w),
                                        state.valueList[index] == 'textField'
                                            ? const TextFieldWidget(
                                                hintText: '选填',
                                              ).withContainer(width: 200.w)
                                            :state.keyList[index] == '申请账户'
                                            ? logic.replaceAsterisksWithImages(
                                            state.valueList[index],color: Colors.black,bottom: 4.w)
                                            :  BaseText(
                                                text: state.valueList[index])
                                      ],
                                    ),
                            );
                    },
                    separatorBuilder: (context, index) {
                      return state.valueList[index] == ''
                          ? const SizedBox.shrink()
                          : Container(
                              width: 1.sw,
                              height: 0.5.w,
                              color: const Color(0xffdedede),
                            );
                    },
                    itemCount: state.keyList.length)
                .withContainer(
              margin: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.w),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.w),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(text: '短信验证'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldWidget(
                        hintText: '请输入验证码',
                      ).withSizedBox(width: 150.w),
                      WzhCountDownBtn(
                        controller: state.downBtnController,
                        showBord: false,
                        textColor: Colors.black,
                        getVCode: () async {
                          return true;
                        },
                      )
                    ],
                  ).withContainer(
                    height: 38.w,
                    padding: EdgeInsets.only(left: 12.w),
                    margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      border: Border.all(
                        color: const Color(0xffdedede),
                        width: 1.sp,
                      ),
                    ),
                  ),

                  logic.replaceAsterisksWithImages(
                      '已向手机号${AppConfig.config.balanceLogic.memberInfo.phone.desensitize(prefixLen: 3)}发送验证码',
                      fontSize: 10.sp,
                      size: 5.w)
                  // BaseText(
                  //   text: '已向手机号${AppConfig.config.balanceLogic.memberInfo.phone.desensitize(prefixLen: 3)}发送验证码',
                  //   fontSize: 10.sp,
                  //   color: Color(0xff999999),
                  // )
                ],
              ),
            )
          ],
        )),
        Container(
          width: 350.w,
          height: 42.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff3768CB), Color(0xff6FACF9)], // 渐变色列表
            ),
            borderRadius: BorderRadius.all(Radius.circular(6.w)),
          ),
          margin: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 10.w,
              bottom: ScreenUtil().bottomBarHeight + 10.w),
          child: BaseText(
            text: "提交申请",
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ).withOnTap(onTap: () {
          //修改日期12 = {map entry} "" -> "434430"

          String beginTime = state.printData.beginTime.replaceAll('/', '-');
          String endTime = state.printData.endTime.replaceAll('/', '-');
          Map<String, dynamic> data = state.printData.toJson();
          data['beginTime'] = beginTime;
          data['endTime'] = endTime;
          print(data);
          Http.post(Apis.flowExportPrint, data: data).then((v) {
            Map<String, dynamic> arg = {};
            arg.addAll(Get.arguments);
            arg['code'] = v['code'];
            Get.offNamed(Routes.printResultPage, arguments: arg);
          });
        }),
      ],
    );
  }
}

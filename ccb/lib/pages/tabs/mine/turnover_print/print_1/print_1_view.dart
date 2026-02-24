import 'dart:math';

import 'package:ccb/pages/tabs/mine/turnover_print/banlixuzhi/banlixuzhi_view.dart';
import 'package:ccb/pages/tabs/mine/turnover_print/component/print_item5_widget.dart';
import 'package:common_utils/common_utils.dart';
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

import '../../../../../config/app_config.dart';
import '../../../../../config/dio/network.dart';
import '../../../../../config/net_config/apis.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/local_notifications.dart';
import '../turnover_print_logic.dart';
import 'print_1_logic.dart';
import 'print_1_state.dart';

class Print1Page extends BaseStateless {
  Print1Page({Key? key}) : super(key: key, title: '流水打印');

  final Print_1Logic logic = Get.put(Print_1Logic());
  final Print_1State state = Get.find<Print_1Logic>().state;
  final TurnoverPrintLogic logic1 = Get.put(TurnoverPrintLogic());

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
    return Container(
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 12.w, bottom: 8.w, top: 18.w),
                child: BaseText(
                  text: '流水打印业务已开通电子邮件服务，推荐您选择电子邮件功能。',
                  fontSize: 11.sp,
                ),
              ),
              PrintItem5Widget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: '温馨提示:',
                        fontSize: 12.sp,
                        color: const Color(0xff333333),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        children: [
                          BaseText(
                            text: '如需查看完整信息，请点击:',
                            fontSize: 12.sp,
                            color: const Color(0xff333333),
                          ),
                          BaseText(
                            text: '查看>',
                            fontSize: 12.sp,
                            color: const Color(0xff283CB1),
                          ).withOnTap(onTap: (){
                            // Get.to(() => BanlixuzhiPage());
                            logic1.ck.value = true;
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        children: [
                          Obx(() => (logic.agree.value
                              ? Icon(Icons.check_circle,
                              size: 17.w, color: const Color(0xff283CB1))
                              : Image(
                            image: 'check1'.png,
                            width: 17.w,
                            height: 17.w,
                            color: Color(0xffA2A2A2),
                          )).withOnTap(onTap: () {
                            logic.agree.value = !logic.agree.value;
                            logic.update(['updateBottom']);
                          })),
                          BaseText(
                            text: '《流水打印业务办理须知》',
                            color: Color(0xff283CB1),
                            fontSize: 12.sp,
                          ).withOnTap(onTap: () {
                            Get.to(() => BanlixuzhiPage());
                            // Get.toNamed(Routes.fixedNavPage, arguments: {
                            //   'title': '办理须知',
                            //   'image': 'blxz',
                            // });
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        children: [
                          Obx(() => (logic.agree.value
                              ? Icon(Icons.check_circle,
                                  size: 17.w, color: const Color(0xff283CB1))
                              : Image(
                                  image: 'check1'.png,
                                  width: 17.w,
                                  height: 17.w,
                                  color: Color(0xffA2A2A2),
                                )).withOnTap(onTap: () {
                                  logic.agree.value = !logic.agree.value;
                                  logic.update(['updateBottom']);
                                })),
                          BaseText(
                            text: ' 我已阅读并同意以上全部内容',
                            fontSize: 12.sp,
                            color: Color(0xff999999),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ).withContainer(
                  width: 350.w,
                  padding: EdgeInsets.only(
                    left: 26.w,
                    right: 26.w,
                  )),
            ],
          )),
          Obx(() => Container(
            width: 350.w,
            height: 42.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: logic.agree.value ? null : const Color(0xffC5D9F8),
              gradient: logic.agree.value
                  ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff3768CB), Color(0xff6FACF9)], // 渐变色列表
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
              text: "提交申请",
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ).withOnTap(onTap: () {
            print(state.printData.toJson());
            if (logic.item5title1 != "在线查看") {
              if(!RegexUtil.isEmail(state.printData.email)){
                '请填写正确的邮箱'.showToast;
                return;
              }
            }

            BaseBottomSheet.sheetContentWidget(
              showLine: false,
                topWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.clear,
                      size: 22.w,
                      color: Colors.black,
                    ).withOnTap(onTap: () {
                      Navigator.of(context).pop();
                    }),
                    BaseText(
                      text: '短信验证',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 22.w),
                  ],
                ).withContainer(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      top: 12.w,
                      bottom: 6.w,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.w),
                          topLeft: Radius.circular(8.w),
                        ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(text: '短信验证',fontSize: 15.sp,),
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
                          height: 42.w,
                          padding: EdgeInsets.only(left: 12.w),
                          margin: EdgeInsets.only(top: 12.w, bottom: 15.w),
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
                            fontSize: 12.sp,
                            size: 5.w),

                      ],
                    ),

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
                          bottom:  10.w),
                      child: BaseText(
                        text: "确认提交",
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ).withOnTap(onTap: () {

                      // if (logic.state.item5title1 == "在线查看")


                      //修改日期12 = {map entry} "" -> "434430"
                      String beginTime = state.printData.beginTime.replaceAll('/', '-');
                      String endTime = state.printData.endTime.replaceAll('/', '-');
                      Map<String, dynamic> data = state.printData.toJson();
                      data['beginTime'] = beginTime;
                      data['endTime'] = endTime;
                      data['type'] = logic.item5title1 == "在线查看" ? 1 : 0;
                      print(data);
                      Http.post(Apis.flowExportPrint, data: data).then((v) {
                        Map<String, dynamic> arg = {};
                        // arg.addAll(Get.arguments);
                        arg.addAll({
                          'info':state.printData
                        });
                        arg['code'] = v['code'];
                        arg['type'] = logic.item5title1;
                        Get.offNamed(Routes.printResultPage, arguments: arg);
                      });
                    }),
                  ],
                ).withContainer(
                  width: 1.sw,
                  height: 250.w,
                  padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.w)
                ));

            Future.delayed(const Duration(milliseconds: 400),(){
              state.downBtnController.click();
            });
            Future.delayed(const Duration(milliseconds: 1500), () {

              NotificationHelper.getInstance().showNotification(
                  title: "建设银行",
                  // body: "您申请的手机银行短信验证码为${Random().nextVerificationCode(6)}，口令有效期为5分钟",
                  body: "【建设银行】短信验证码为${Random().nextVerificationCode(6)}，"
                      "有效期5分钟，您正在手机银行交易。任何索要验证码的都是骗子，千万别给!",
                  payload: "payload");
            });


            // Get.toNamed(Routes.printInfoPage,arguments: {
            //   'info':state.printData,
            // });
          }))
        ],
      ),
    );
  }
}

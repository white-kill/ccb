import 'dart:io';

import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../utils/scale_point_widget.dart';
import 'seal_logic.dart';
import 'seal_state.dart';

class SealPage extends BaseStateless {
  SealPage({Key? key}) : super(key: key, title: '电子印章查验');

  final SealLogic logic = Get.put(SealLogic());
  final SealState state = Get.find<SealLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  List<Widget>? get rightAction => [
        ScalePointWidget(
          icColor: Colors.black,
        ).withPadding(right: 6.w),
        Icon(
          Icons.clear,
          color: Colors.black,
        ).withOnTap(onTap: () {
          Get.back();
        }).withPadding(
          right: 16.w,
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 55.w,
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                children: [
                  Row(
                    children: [
                      BaseText(
                        text: '交易或打印日期',
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Image(
                        image: 'ic_dzyz'.png3x,
                        width: 22.w,
                        height: 22.w,
                      )
                    ],
                  ).withContainer(width: 140.w),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(text: logic.formattedDate),
                      Image(
                        image: 'ic_dzyz_time'.png3x,
                        width: 22.w,
                        height: 22.w,
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Container(
              height: 1.w,
              margin: EdgeInsets.only(left: 12.w, right: 12.w),
              color: Color(0xffdedede),
            ),
            Container(
              height: 55.w,
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                children: [
                  BaseText(
                    text: '验证码',
                    fontSize: 14.sp,
                  ).withContainer(width: 120.w),
                  TextFieldWidget(
                    hintText: '请输入电子印章12位验证码',
                    controller: state.controller,
                  ).withContainer(width: 1.sw - 160.w)
                ],
              ),
            ),
            Container(
              height: 1.w,
              margin: EdgeInsets.only(left: 12.w, right: 12.w),
              color: Color(0xffdedede),
            ),
            BaseText(
              text: '温馨提示',
              fontSize: 14.sp,
              color: Color(0xff666666),
            ).withPadding(left: 20.w, top: 20.w, bottom: 6.w),
            BaseText(
              maxLines: 10,
              text: '手机银行支持查询自交易发生一年内的电子印章信息，您可前往中国建设银行营业网点柜台查询更多信息，',
              fontSize: 12.sp,
              color: const Color(0xff999999),
            ).withPadding(left: 20.w, right: 20.w)
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
            text: "查询",
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ).withOnTap(onTap: () {
          if(AppConfig.config.balanceLogic.memberInfo.payStatus != '1'){
            '请升级配置'.showToast;
            return;
          }
          Http.get(Apis.checkPrint, queryParameters: {
            'code': state.controller.text,
          }).then((v) {
            if (state.controller.text == '') {
              '请输入电子印章12位验证码'.showToast;
              return;
            }
            if (v != null && v is List) {
              if (v.length > 1) {
                BaseBottomSheet.sheetContentWidget(
                    title: "请选择电子印章",
                    child: Column(
                      children: v.map((e) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 12.w),
                              height: 50.w,
                              alignment: Alignment.centerLeft,
                              child: BaseText(
                                text: '电子印章(${v.indexOf(e) + 1})',
                                fontSize: 16.w,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 12.w),
                              child: Icon(
                                Icons.navigate_next,
                                size: 24.w,
                                color: const Color(0xff666666),
                              ),
                            )
                          ],
                        ).withOnTap(onTap: () {
                          logic.downloadAndSharePdf(e);
                          Get.back();
                        });
                      }).toList(),
                    ));
              }
              if (v.length == 1) {
                logic.downloadAndSharePdf(v.first);
              }
            } else {
              '查询失败，请检查12位验证码'.showToast;
            }
          });
        }),
      ],
    );
  }
}

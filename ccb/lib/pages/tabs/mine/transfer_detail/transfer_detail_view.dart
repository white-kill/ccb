import 'package:ccb/pages/tabs/mine/transfer_detail/zzjd/zzjd_view.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/scale_point_widget.dart';
import 'transfer_detail_logic.dart';
import 'transfer_detail_state.dart';

class TransferDetailPage extends BaseStateless {
  TransferDetailPage({Key? key}) : super(key: key, title: '转账详情');

  final TransferDetailLogic logic = Get.put(TransferDetailLogic());
  final TransferDetailState state = Get.find<TransferDetailLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  List<Widget>? get rightAction => [

     ScalePointWidget(
      icColor: Colors.white,
      dx: 35.w,
       left: 80.w,
    ).withPadding(right: 18.w),


  ];

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (TransferDetailLogic c) {
        return Column(
          children: [
            Expanded(child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Container(
                  color: Colors.white,
                  height: 160.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text: logic.state.infoModel.oppositeName,
                        fontSize: 16.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NetImageWidget(url:state.infoModel.icon,width: 20.w,height: 20.w,),
                          BaseText(text: "${state.infoModel.bankName} (${state.infoModel.oppositeAccount.getLastFourByList()})"),

                        ],
                      ).withPadding(
                        top: 6.w,
                        bottom: 10.w,
                      ),
                      BaseText(
                        text: '¥ ${state.infoModel.amount.bankBalance}',
                        fontSize: 35.sp,
                        color: const Color(0xff3C6DD3),
                      ),
                    ],
                  ),
                ),

                const DottedDashedLine(height: 0, width: 100, axis: Axis.horizontal).withContainer(
                    padding: EdgeInsets.only(left: 20.w,right: 20.w)
                ),

                Container(
                  height: 10.w,
                  color: Colors.white,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: 34.w,
                        ),
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child:state.nameLis[index] == '转账进度'?Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                BaseText(text: state.nameLis[index]),
                                Image(image: 'jh_tips'.png3x,
                                  width: 15.w,
                                  height: 15.w,
                                ).withContainer(
                                  width:27.w,
                                  height: 22.w,
                                  alignment: Alignment.center,
                                ).withOnTap(onTap: (){
                                  SmartDialog.show(
                                    usePenetrate: false,
                                    clickMaskDismiss: false,
                                    builder: (_) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 1.sw * 0.88,
                                              constraints: BoxConstraints(minHeight: 100.w),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8.w),
                                                  topLeft: Radius.circular(8.w),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 24.w,
                                                  ),
                                                  BaseText(
                                                    text: '暂支持查询2025年06月29日起在个人手机银行、个人网银办理的转账进度',
                                                    maxLines: 5,
                                                    style: TextStyle(
                                                      height: 1.8,
                                                      fontSize: 14.sp,
                                                      color: Color(0xff666666)
                                                    ),
                                                  ).withPadding(
                                                    left: 24.w,
                                                    right: 24.w,
                                                  ),
                                                  SizedBox(
                                                    height: 24.w,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            width: 1.sw * 0.88,
                                            height: 0.5.w,
                                            color: const Color(0xffbbbbab),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(8.w),
                                                bottomLeft: Radius.circular(8.w),
                                              ),
                                            ),
                                            height: 42.w,
                                            width: 1.sw * 0.88,
                                            child:  Container(
                                              alignment: Alignment.center,
                                              child: (const BaseText(
                                                text: '确定',
                                                color: Colors.blueAccent,
                                              )),
                                            ).withOnTap(onTap: () {
                                              SmartDialog.dismiss();
                                            }),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                })
                              ],
                            ),

                            Row(
                              children: [
                                BaseText(
                                  text: logic.valueName(state.nameLis[index]),
                                  maxLines: 10,
                                  textAlign: TextAlign.right,
                                ),
                                Image(image: 'ic_zh_mx_next'.png3x,width: 18.w,height: 18.w,)
                              ],
                            ).withOnTap(onTap: (){
                              Get.to(() => ZzjdPage(),arguments: {
                                'time':state.infoModel.transactionTime,
                              });
                            })
                          ],
                        ):Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(text: state.nameLis[index]),
                            BaseText(
                              text: logic.valueName(state.nameLis[index]),
                              maxLines: 10,
                              textAlign: TextAlign.right,
                            ).withSizedBox(width: 200.w)
                          ],
                        ),
                      );
                    },
                    itemCount: state.nameLis.length)
                    .withContainer(
                  color: Colors.white,),
                Container(
                  height: 10.w,
                  color: Colors.white,
                ),

                Container(
                  height: 45.w,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 20.w),
                  padding: EdgeInsets.only(left: 20.w,right: 20.w),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(text: '查看和TA的转账记录'),
                      Icon(
                        Icons.navigate_next,
                        color: Color(0xff999999),
                      )
                    ],
                  ),
                ).withOnTap(onTap: (){
                  Get.offAndToNamed(Routes.personTransferPage,arguments: {
                    'oppositeAccount':logic.state.infoModel.oppositeAccount,
                    'id':Get.arguments['id'],
                    // 'click':false,
                  });
                }),

                BaseText(
                  text: '温馨提示',
                  fontSize: 14.sp,
                  color: Color(0xff666666),
                ).withPadding(left: 20.w,top: 20.w,bottom: 6.w),

                BaseText(
                  maxLines: 10,
                  text: '此页面说明转账交易受理成功，'
                      '不代表资金已转入收款账广不作为收付方交易确认的最终依据。'
                      '交易结果请以收款账户实际入账为准。',
                  fontSize: 12.sp,
                  color: Color(0xff999999),
                ).withPadding(left: 20.w, right: 20.w)
              ],
            )),

            Container(
              height: 90.w +  ScreenUtil().bottomBarHeight,
              width: 1.sw,
              color: Colors.white,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                  top: 15.w,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                      child: Container(
                        height: 45.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.w)),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.w,
                          ),
                        ),
                        child: BaseText(
                          text: '再次转账',
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ).withOnTap(onTap: () {
                        Get.back();
                        Get.back();
                      })),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                      child: Container(
                        height: 45.w,
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
                          text: '电子回单',
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ).withOnTap(onTap: () {
                        state.argMap['info'] =  state.infoModel;
                        Get.toNamed(Routes.mineReceiptPage,arguments:state.argMap);
                      })),
                  SizedBox(
                    width: 12.w,
                  ),
                ],
              ),
            )
          ],
        );
      },
      id: 'updateUI',
    );
  }
}

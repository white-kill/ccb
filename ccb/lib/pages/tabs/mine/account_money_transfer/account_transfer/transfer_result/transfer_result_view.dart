import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import 'transfer_result_logic.dart';
import 'transfer_result_state.dart';

class TransferResultPage extends BaseStateless {
  TransferResultPage({Key? key}) : super(key: key);

  final TransferResultLogic logic = Get.put(TransferResultLogic());
  final TransferResultState state = Get.find<TransferResultLogic>().state;

  @override
  Widget? get leftItem => Container();

  @override
  List<Widget>? get rightAction => [
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 14.w, right: 15.w),
          child: BaseText(
            text: '完成',
            style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xff3C6DD3),
                fontWeight: FontWeight.bold),
          ),
        ).withOnTap(onTap: () {
          Get.back();
        })
      ];

  List<String> titleList = ['转账金额', '收款账户'];

  List<String> titleList1 = ['转账金额', '收款账户', '收款银行', '付款账户', '付款账户余额'];

  String valueTitle(int index) {
    if (index == 0) {
      return '${logic.argData['money']}元';
    }
    if (index == 1) {
      return logic.argData['account'];
    }
    if (index == 2) {
      return Get.arguments?['bank'];
    }
    if (index == 3) {
      return '建设银行 ${Get.arguments?['fkAccount']}';
    }
    if (index == 4) {
      return Get.arguments?['yue'];
    }
    return '';
  }

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 15.w,
        ),
        Image(
          image: 'ic_zh_end'.png3x,
          width: 80.w,
          height: 80.w,
        ),
        BaseText(
          text: '转账成功',
          fontSize: 18.sp,
          color: const Color(0xff3C6DD3),
        ).withContainer(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20.w, bottom: 12.w)),
        BaseText(
          text: '一般情况下，'
              '资金实时转入收款账户，'
              '实际转入收款账户时间视收款行处理而定。'
              '如有疑问，请咨询收款行。',
          color: const Color(0xff666666),
          maxLines: 10,
          fontSize: 15.sp,
        ),
        SizedBox(
          height: 12.w,
        ),
        Obx(() => ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 45.w,
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                        text: logic.isShow.value
                            ? titleList[index]
                            : titleList1[index]),
                    BaseText(text: valueTitle(index),color: Color(0xff333333),)
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                width: 1.sw,
                height: 0.5.w,
                color: const Color(0xffdedede),
              );
            },
            itemCount:
                logic.isShow.value ? titleList.length : titleList1.length)),
        SizedBox(height: 12.w),
        Obx(() => Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    text: logic.isShow.value ? '点击展开' : '点击收起',
                    color: const Color(0xff3C6DD3),
                  ),
                  Image(
                    image: logic.isShow.value
                        ? 'bg_down_ar'.png3x
                        : 'bg_down_up'.png3x,
                    width: 28.w,
                    height: 20.w,
                  ),
                ],
              ),
            ).withOnTap(onTap: () {
              logic.isShow.value = !logic.isShow.value;
            })),
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
                  border: Border.all(
                    color: Colors.black,
                    width: 1.w,
                  ),
                ),
                child: BaseText(
                  text: '继续转账',
                  fontSize: 13.sp,
                ),
              ).withOnTap(
                onTap: () {
                  Get.offAndToNamed(Routes.accountTransferPage,);
                },
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Container(
                height: 36.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.w)),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.w,
                  ),
                ),
                child: BaseText(
                  text: '我的账户',
                  fontSize: 13.sp,
                ),
              ).withOnTap(
                onTap: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
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
                  text: '通知收款人',
                  fontSize: 13.sp,
                  color: Colors.white,
                ),
              ).withOnTap(
                onTap: () {
                  // print(Get.arguments);
                  BaseBottomSheet.sheetContentWidget(
                      topWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.clear,
                            size: 22.w,
                            color: Colors.white,
                          ).withOnTap(onTap: () {
                            Navigator.of(context).pop();
                          }),
                          const BaseText(
                            text: '',
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                        ],
                      ).withContainer(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            top: 12.w,
                            bottom: 12.w,
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xff3C6DD3),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.w),
                                topLeft: Radius.circular(8.w),
                              ))),
                      child: Column(
                        children: ['微信通知收款人', '短信通知收款人'].map((e) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      // Image(
                                      //   image: 'ic_jsyh'.png3x,
                                      //   width: 24.w,
                                      //   height: 24.w,
                                      // ),
                                      // SizedBox(width: 4.w),
                                      BaseText(
                                        text: e,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color(0xff666666),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ).withPadding(
                                top: 10.w,
                                bottom: 10.w,
                              )
                                  .withOnTap(onTap: () {
                                if (e == '微信通知收款人') {
                                  Get.toNamed(Routes.mineReceiptPage,
                                      arguments: {'id': logic.argData['id']});
                                }
                                if (e == '短信通知收款人') {
                                  Get.toNamed(
                                    Routes.sendMessagePage,
                                  );
                                }
                              }),
                              e == '微信通知收款人'?Container(
                                width: 1.sw,
                                height: 0.5.w,
                                color: const Color(0xffdedede),
                              ):const SizedBox.shrink(),
                            ],
                          );
                        }).toList(),
                      ));
                },
              ),
            ),
          ],
        ),
      ],
    ).withContainer(
        color: Colors.white, padding: EdgeInsets.only(left: 16.w, right: 16.w));
  }
}

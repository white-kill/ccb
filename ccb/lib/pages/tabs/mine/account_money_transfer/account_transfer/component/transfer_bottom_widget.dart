import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/component/transfer_verification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_transfer_logic.dart';

class TransferBottomWidget extends StatefulWidget {
  final bool isPhone;
  const TransferBottomWidget({super.key, required this.isPhone});

  @override
  State<TransferBottomWidget> createState() => _TransferBottomWidgetState();
}

class _TransferBottomWidgetState extends State<TransferBottomWidget> {
  String type = '0';

  List daoZhangList = [
    ['实时转账', '实时转出，不可撤销'],
    ['2小时后转账', '实时扣款，2小时后转出，期间可撤销'],
    ['次日转账', '实时扣款，次日凌晨转出，当日可撤销']
  ];

  List tisTitle = [
    '转账方式: 实时转账(不可撤销)',
    '2小时后转账',
    '次日转账'
  ];

  String styleName = '';



  @override
  void initState() {
    super.initState();
    styleName = tisTitle[0];
  }

  Widget _typeText(String type) {
    if (type == '0') {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '预计',
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff999999),
              ),
            ),
            TextSpan(
              text: '实时到账',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      );
    } else if (type == '1') {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '2小时后',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.orange,
              ),
            ),
            TextSpan(
              text: '提交处理。',
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff999999),
              ),
            ),
            TextSpan(
              text: '到账时间详情 >',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      );
    } else {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '次日',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.orange,
              ),
            ),
            TextSpan(
              text: '凌晨提交处理。',
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff999999),
              ),
            ),
            TextSpan(
              text: '到账时间详情 >',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetBuilder(
          builder: (AccountTransferLogic c) {
            bool click = c.state.nameTextController.text != '' &&
                c.state.accountTextController.text != '' &&
                c.state.moneyStr != '' &&
                c.state.bankData['name'] != '';
            return click
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _typeText(type),
                      BaseText(
                        text: '更改',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.blueAccent,
                        ),
                        color: Colors.blue,
                      ).withOnTap(onTap: () {
                        BaseBottomSheet.sheetContentWidget(
                            title: '选择转账方式',
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (c, i) {
                                return Container(
                                  padding: EdgeInsets.only(top: 12.w,bottom: 12.w),
                                  child: Column(
                                    children: [
                                      BaseText(text: daoZhangList[i][0]),
                                      BaseText(text: daoZhangList[i][1]),
                                    ],
                                  ),
                                ).withOnTap(onTap: (){
                                  type = i.toString();
                                  styleName = tisTitle[i];
                                  Get.back();
                                  setState(() {});
                                });
                              },
                              itemCount: daoZhangList.length,
                              separatorBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 1.sw,
                                  height: 0.5.w,
                                  color: const Color(0xffdedede),
                                );
                            },
                            ));
                      }),
                    ],
                  ).withContainer(
                    padding:
                        EdgeInsets.only(left: 32.w, right: 32.w, top: 12.sp),
                    width: 1.sw)
                : BaseText(
                    text: "将根据转账的信息预计到账时间",
                    fontSize: 12.sp,
                    color: const Color(0xff999999),
                  )
                    .withContainer(
                      width: 350.w,
                      alignment: Alignment.centerLeft,
                    )
                    .withPadding(
                      left: 38.w,
                      top: 12.w,
                    );
          },
          id: 'updateBottom',
        ),
        SizedBox(
          height: 32.w,
        ),
        GetBuilder(
          builder: (AccountTransferLogic c) {
            bool click = c.state.nameTextController.text != '' &&
                c.state.accountTextController.text != '' &&
                c.state.moneyStr != '' &&
                c.state.bankData['name'] != '';
            return Container(
              width: 340.w,
              height: 45.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: click ? null : const Color(0xffC5D9F8),
                gradient: click
                    ? const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff3768CB), Color(0xff6FACF9)], // 渐变色列表
                      )
                    : null,
                borderRadius: BorderRadius.all(Radius.circular(6.w)),
              ),
              child: BaseText(
                text: "下一步",
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ).withOnTap(onTap: () {
              if(Get.arguments?['isPhone'] == true) return;
              final AccountTransferLogic logic = Get.put(AccountTransferLogic());
              if(logic.state.accountTextController.text.length <10){
                '请输入正确的银行卡号'.showToast;
                return;
              }
              if (!click) return;
              AlterWidget.alterWidget(builder: (context) {
                return TransferVerificationWidget(
                  styleName: styleName,
                );
              });
            });
          },
          id: 'updateBottom',
        ),
        SizedBox(
          height: 32.w,
        ),
        Image(image:widget.isPhone?'sjhzz'.png:'zhzz'.png),
        // BaseText(
        //   text: "温馨提示",
        //   style: TextStyle(
        //     fontSize: 13.sp,
        //     // fontWeight: FontWeight.bold,
        //     color: const Color(0xff333333),
        //   ),
        // )
        //     .withContainer(
        //       width: 350.w,
        //       alignment: Alignment.centerLeft,
        //     )
        //     .withPadding(
        //       left: 38.w,
        //     ),
        // SizedBox(
        //   height: 16.w,
        // ),
        // BaseText(
        //   text: "请勿轻易向陌生收款人转账，请勿相信以兼职、投资为借口或假冒客服、"
        //       "公检法、熟人等骗局，请仔细核实收款方信息，"
        //       "谨防新型电信诈骗，切勿上当受骗，"
        //       "如有疑问请咨询 95533。",
        //   maxLines: 20,
        //   style: TextStyle(
        //       fontSize: 12.sp, color: const Color(0xff9A9A9A), height: 24 / 12),
        // )
        //     .withContainer(
        //       width: 350.w,
        //       alignment: Alignment.centerLeft,
        //     )
        //     .withPadding(left: 38.w, right: 38.w),
        SizedBox(
          height: ScreenUtil().bottomBarHeight + 25.w,
        ),
      ],
    );
  }
}

import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/balance_config/balance_eye_widget.dart';
import '../../../../../config/balance_config/balance_logic.dart';
import '../../../../../data/model/member_info_entity.dart';
import '../../../../../routes/app_pages.dart';

class AccountPreviewTab2 extends StatefulWidget {
  const AccountPreviewTab2({super.key});

  @override
  State<AccountPreviewTab2> createState() => _AccountPreviewTab2State();
}

class _AccountPreviewTab2State extends State<AccountPreviewTab2> {
  List<String> cardNameList = [
    '储蓄卡',
    '信用卡',
  ];

  String cardName = '储蓄卡';

  List<String> cardFunctionList = [
    '明细',
    '',
    '转账',
    '',
    '无卡取款',
    '',
    '买理财',
  ];

  void jumpPage(String name) {
    if (name == '明细') {
      Get.toNamed(Routes.accountDetail);
    }

    if (name == '转账') {
      Get.toNamed(Routes.accountTransferPage);
    }

    if (name == '扫码办') {
      Get.toNamed(Routes.wkqk);
    }
    if (name == '买理财') {
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '理财产品',
        'image': 'bg_lccp',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF327DE8),
        //   image: DecorationImage(
        //   alignment: Alignment.topCenter,
        //   image: 'bg_account_preview_top2'.png3x,
        //   fit: BoxFit.fitWidth,
        // ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.w),
          topRight: Radius.circular(12.w),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                border: Border.all(
                  width: 0,
                  color: const Color(0xffF6F6F6),
                ),
              ),
              padding: EdgeInsets.only(top: 16.w, left: 8.w),
              child: Row(
                children: cardNameList.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 6.w, bottom: 6.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: cardName == e
                            ? const Color(0xFFE2ECF8)
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      ),
                      child: BaseText(
                        text: e,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: cardName == e
                                ? Color(0xFF578AD6)
                                : Colors.black,
                            fontWeight: cardName == e
                                ? FontWeight.w600
                                : FontWeight.w400),
                      ),
                    ).withOnTap(onTap: () {
                      cardName = e;
                      setState(() {});
                    }),
                  );
                }).toList(),
              ),
            ),
            if (cardName == '储蓄卡') ...card1(),
            if (cardName == '信用卡') ...card2(),
          ],
        ),
      ),
    );
  }

  List<Widget> card1() {
    return [
      ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          MemberInfoBankList infoModel =
              AppConfig.config.balanceLogic.memberInfo.bankList[index];
          return Container(
            height: 192.w,
            width: 350.w,
            color: const Color(0xffF6F6F6),
            child: Container(
              width: 350.w,
              height: 180.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w),
              ),
              margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
              child: Column(
                children: [
                  Expanded(child: cardInfo(infoModel)),
                ],
              ),
            ),
          );
        },
        itemCount: AppConfig.config.balanceLogic.memberInfo.bankList.length,
      ),

      Stack(
        children: [
          Image.asset(
            "assets/images/bg_zh_bottom@3x.png",
            width: screenWidth,
            height: screenWidth / 3240 * 5169,
          ),
          Positioned(
              top: 0,
              left: 0,
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.mainEAccountPage,
                  );
                },
                child: Container(
                  width: screenWidth,
                  height: screenWidth / 3240 * 5169 * 0.3,
                ),
              )),
          Positioned(
              top: screenWidth / 3240 * 5169 * 0.33,
              left: 0,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.changeNavPage, arguments: {
                    'title': '个人养老金',
                    'image': 'bg_grylj',
                  });
                },
                child: Container(
                  width: screenWidth,
                  height: screenWidth / 3240 * 5169 * 0.3,
                ),
              )),
          Positioned(
              bottom: screenWidth / 3240 * 5169 * 0.05,
              left: 0,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.addBank);
                },
                child: Container(
                  width: screenWidth,
                  height: screenWidth / 3240 * 5169 * 0.08,
                ),
              ),)
        ],
      ),
    ];
  }

  List<Widget> card2() {
    return [
      Container(
        color: const Color(0xFFF2F2F5),
        padding: EdgeInsets.only(top: 14.w, left: 12.w, right: 12.w),
        child: _containerBg(
          width: 350.w,
          height: 180.w,
          imagePath: 'ic_xyk_sq',
        ),
      ).withOnTap(onTap: () {
        Get.toNamed(Routes.naviOffset, arguments: {
          'title': '信用卡申请',
          'image': 'bg_xyksq',
        });
      }),
    ];
  }

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    '复制成功'.showToast;
  }

  Widget cardInfo(MemberInfoBankList infoModel) {
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenWidth / 3042 * 1563,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'bg_my_card'.png3x,
              fit: BoxFit.fill,
            ),
          ),
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Image(
          //       image: 'ic_jsyh'.png3x,
          //       width: 44.w,
          //       height: 44.w,
          //     ),
          //     SizedBox(width: 8.w),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             GetBuilder(builder: (BalanceLogic c){
          //               return c.cardInfoWidget();
          //             },id: 'updateUI',),
          //             SizedBox(width: 5.w,),
          //             BaseText(
          //               text: '查看卡号',
          //               style: TextStyle(
          //                 fontSize: 12.sp,
          //                 fontFamily: 'PingFangSC',
          //                 color: const Color(0xff5489F0),
          //               ),
          //             ).withOnTap(onTap: () {
          //               SmartDialog.show(
          //                 usePenetrate: false,
          //                 clickMaskDismiss: false,
          //                 builder: (_) {
          //                   return Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     crossAxisAlignment: CrossAxisAlignment.center,
          //                     children: [
          //                       Container(
          //                           width: 1.sw * 0.88,
          //                           constraints: BoxConstraints(minHeight: 100.w),
          //                           decoration: BoxDecoration(
          //                             color: Colors.white,
          //                             borderRadius: BorderRadius.only(
          //                              topRight:  Radius.circular(8.w),
          //                              topLeft:  Radius.circular(8.w),
          //                             ),
          //                           ),
          //                           child: Column(
          //                             crossAxisAlignment: CrossAxisAlignment.center,
          //                             mainAxisAlignment: MainAxisAlignment.center,
          //                             children: [
          //                               SizedBox(height: 24.w,),
          //                               BaseText(
          //                                 text: infoModel.bankCard,
          //                                 fontSize: 14.sp,
          //                               ),
          //                               SizedBox(height: 10.w,),
          //                               BaseText(
          //                                 text: '中国建设银行股份有限公司${infoModel.openOutlets}',
          //                                 maxLines: 5,
          //                                 fontSize: 14.sp,
          //                                 textAlign: TextAlign.center,
          //                               ).withPadding(
          //                                 left: 24.w,right: 24.w,
          //                               ),
          //                               SizedBox(height: 24.w,),
          //                             ],
          //                           )),
          //                       Container(
          //                         width: 1.sw * 0.88,
          //                         height: 0.5.w,
          //                         color: const Color(0xffbbbbab),
          //                       ),
          //                       Container(
          //                         decoration: BoxDecoration(
          //                           color: Colors.white,
          //                           borderRadius: BorderRadius.only(
          //                             bottomRight:  Radius.circular(8.w),
          //                             bottomLeft:  Radius.circular(8.w),
          //                           ),
          //                         ),
          //                         height: 42.w,
          //                         width: 1.sw * 0.88,
          //                         child: Row(
          //                           children: [
          //                             Expanded(
          //                                 child: Container(
          //                                   alignment: Alignment.center,
          //                                   child: ( const BaseText(
          //                                     text: '复制全部',
          //                                     color: Colors.blueAccent,
          //                                   )),
          //                                 ).withOnTap(onTap: () {
          //                                   copyToClipboard('${infoModel.bankCard} ${infoModel.branchBelongs}');
          //                                   SmartDialog.dismiss();
          //                                 })),
          //                             Container(
          //                               width: 0.5.w,
          //                               height: 42.w,
          //                               color: const Color(0xffbbbbab),
          //                             ),
          //                             Expanded(
          //                                 child: Container(
          //                                   alignment: Alignment.center,
          //                                   child: (const BaseText(
          //                                     text: '仅复制卡号',
          //                                     color: Colors.blueAccent,
          //                                   )),
          //                                 ).withOnTap(onTap: () {
          //                                   copyToClipboard(infoModel.bankCard);
          //                                   SmartDialog.dismiss();
          //                                 })),
          //                           ],
          //                         ),
          //                       ),
          //                       Image(image: 'ic_updata_close'.png3x,width: 24.w,height: 24.w,).withOnTap(onTap: (){
          //                         SmartDialog.dismiss();
          //                       }).withPadding(top: 25.w),
          //                     ],
          //                   );
          //                 },
          //               );
          //             })
          //           ],
          //         ),
          //         SizedBox(height: 4.w),
          //       Row(
          //         children: [
          //           BaseText(
          //             text: "龙卡通",
          //             color: Color(0xff9A9C9F),
          //             fontSize: 12.sp,
          //           ),
          //           SizedBox(width: 8.w,),
          //           Container(
          //             decoration: BoxDecoration(
          //                 color: Color(0xff5489F0).withOpacity(0.2),
          //                 borderRadius: BorderRadius.all(Radius.circular(2.w))
          //             ),
          //             width: 22.w,height: 12.w,
          //             child: BaseText(text: '正常',
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                   color: Color(0xff5489F0),
          //                   // height: 1,
          //                   fontSize: 9.sp
          //               ),),
          //           ),
          //         ],
          //       ),
          //         SizedBox(height: 18.w),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     BaseText(
          //                       text: "可用余额(元)",
          //                       color: Color(0xff9A9C9F),
          //                       fontSize: 12.sp,
          //                     ),
          //                     SizedBox(
          //                       width: 6.w,
          //                     ),
          //                     BalanceEyeWidget(
          //                       openEye: 'ic_zhanghu',
          //                       closeEye: 'ic_zhanghu2',
          //                       width: 18.w,
          //                       height: 18.w,
          //                     )
          //                   ],
          //                 ),
          //                 SizedBox(height: 8.w),
          //                 GetBuilder(builder: (BalanceLogic c) {
          //                  return BalanceWidget(
          //                     child: BaseText(
          //                       // text: NumberFormat().format(c.memberInfo.accountBalance),
          //                       text: "62.73",
          //                       style: TextStyle(
          //                         fontFamily: 'Money',
          //                           fontWeight: FontWeight.w800, fontSize: 26.w, letterSpacing: 1),
          //                     ),
          //                   );
          //                 },id: 'updateBalance',),
          //               ],
          //             ),
          //             Container(
          //               width: 65.w,
          //               height: 28.w,
          //             ).withOnTap(onTap: () {
          //               Get.toNamed(
          //                 Routes.cardDetailPage,
          //               );
          //             })
          //           ],
          //         ).withContainer(width: 280.w)
          //       ],
          //     )
          //   ],
          // ).withPadding(
          //   left: 12.w,
          //   top: 12.w,
          // ),
        ),
        Positioned(
          left: screenWidth * 0.19,
          top: screenWidth / 3042 * 1563 * 0.10,
          child: Row(
            children: [
              GetBuilder(
                builder: (BalanceLogic c) {
                  return c.cardInfoWidget();
                },
                id: 'updateUI',
              ),
              SizedBox(
                width: 5.w,
              ),
              BaseText(
                text: '查看卡号',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'PingFangSC',
                    color: const Color(0xFF0B81F0),
                    fontWeight: FontWeight.w400),
              ).withOnTap(onTap: () {
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
                                  text: infoModel.bankCard,
                                  fontSize: 14.sp,
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                BaseText(
                                  text: '中国建设银行股份有限公司${infoModel.openOutlets}',
                                  maxLines: 5,
                                  fontSize: 14.sp,
                                  textAlign: TextAlign.center,
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
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                child: (const BaseText(
                                  text: '复制全部',
                                  color: Colors.blueAccent,
                                )),
                              ).withOnTap(onTap: () {
                                copyToClipboard(
                                    '${infoModel.bankCard} ${infoModel.branchBelongs}');
                                SmartDialog.dismiss();
                              })),
                              Container(
                                width: 0.5.w,
                                height: 42.w,
                                color: const Color(0xffbbbbab),
                              ),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                child: (const BaseText(
                                  text: '仅复制卡号',
                                  color: Colors.blueAccent,
                                )),
                              ).withOnTap(onTap: () {
                                copyToClipboard(infoModel.bankCard);
                                SmartDialog.dismiss();
                              })),
                            ],
                          ),
                        ),
                        Image(
                          image: 'ic_updata_close'.png3x,
                          width: 24.w,
                          height: 24.w,
                        ).withOnTap(onTap: () {
                          SmartDialog.dismiss();
                        }).withPadding(top: 25.w),
                      ],
                    );
                  },
                );
              })
            ],
          ),
        ),
        Positioned(
            left: screenWidth * 0.40,
            top: screenWidth / 3042 * 1563 * 0.42,
            child: BalanceEyeWidget(
              openEye: 'ic_zhanghu',
              closeEye: 'ic_zhanghu2',
              width: 15.2.w,
              height: 11.2.w,
            )),

        GetBuilder(
            id: 'updateBalance',
            builder: (BalanceLogic c) {
              return Positioned(
                left: screenWidth * 0.19,
                top: c.showValue.value
                    ? screenWidth / 3042 * 1563 * 0.52
                    : screenWidth / 3042 * 1563 * 0.55,
                child: Column(
                  children: [
                    BalanceWidget(
                        child: Column(
                          children: [
                            Row(
                             children: [
                            BaseText(
                              text:  NumberFormat().format(c.memberInfo.accountBalance),
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.0,
                                  letterSpacing: 1),
                            )
                            // MoneyFormatUtil.formatAmount(
                            //   c.memberInfo.accountBalance,
                            //   fontSize: 26.sp,
                            //   fontWeight: FontWeight.w800,
                            //   height: 1.0,
                            //   letterSpacing: 1,
                            // ),
                                              ],
                                            )
                          ],
                        )),
                  ],
                ),
              );
            }),
        Positioned(
            left: screenWidth * 0.77,
            top: screenWidth / 3042 * 1563 * 0.47,
            child: Container(
              width: 65.w,
              height: 28.w,
              child: Text(
                '详情',
                style: TextStyle(
                    color: const Color(0xFF0B81F0),
                    fontFamily: 'PingFangSC',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
            ).withOnTap(onTap: () {
              Get.toNamed(
                Routes.cardDetailPage,
              );
            })),
        Positioned(
            bottom: 0,
            left: screenWidth * 0.002,
            child: Container(
              height: 42.w,
              width: screenWidth,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: screenWidth * 0.24,
                  height: 42.w,
                ).withOnTap(onTap: () {
                  jumpPage('明细');
                }),
                Container(
                  width: screenWidth * 0.22,
                  height: 42.w,
                ).withOnTap(onTap: () {
                  jumpPage('转账');
                }),
                Container(
                  width: screenWidth * 0.23,
                  height: 42.w,
                ).withOnTap(onTap: () {
                  jumpPage('扫码办');
                }),
                Container(
                  width: screenWidth * 0.22,
                  height: 42.w,
                ).withOnTap(onTap: () {
                  jumpPage('买理财');
                }),
              ]),
            ))
      ],
    );
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF6FCFF).withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}

import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/main/my_app_page.dart';
import 'package:ccb/pages/account/login/login_logic.dart';
import 'package:ccb/pages/account/login/login_view.dart';
import 'package:ccb/pages/tabs/mine/account_preview/component/account_preview_chat_widget.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../account_preview_logic.dart';

class AccountPreviewTab1 extends StatefulWidget {
  const AccountPreviewTab1({super.key});

  @override
  State<AccountPreviewTab1> createState() => _AccountPreviewTab1State();
}

class _AccountPreviewTab1State extends State<AccountPreviewTab1> {
  List infoDataList = [
    {'image': 'ic_a_p_0', 'name': '账户明细'},
    {'image': 'ic_a_p_1', 'name': '转账汇款'},
    {'image': 'ic_a_p_2', 'name': '财富体检'},
  ];

  bool showInfo = false;
  int segment = 1; // 1: 总资产, 2: 总负债
  bool _balanceDetailExpanded = false; // 总资产详情是否展开
  bool _debtDetailExpanded = false; // 总负债详情是否展开

  void toggleSegment() {
    setState(() {
      segment = segment == 1 ? 2 : 1;
    });
  }

  void jumpPage(String name) {
    if (name == '账户明细') {
      Get.toNamed(Routes.accountDetail);
    }
    if (name == '转账汇款') {
      Get.toNamed(Routes.accountMoneyTransferView);
    }
    if (name == '财富体检') {
      Get.toNamed(Routes.cftj);
    }
  }

  Widget _addToolTipDialog() {
    return Image(
      image: 'ic_tooltip'.png3x,
      width: 12.w,
      height: 12.w,
    ).withPadding(left: 5.w).withOnTap(onTap: () {
      SmartDialog.show(
        usePenetrate: false,
        clickMaskDismiss: false,
        builder: (_) {
          return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 0.8.sw,
                  child: Stack(
                    children: [
                      Image(
                        image: "bg_tooltip".png3x,
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        top: 50.w,
                        left: 20.w,
                        width: 0.8.sw - 40.w,
                        height: (screenWidth * 0.8 - 40) / 870 * 1365,
                        child: Text(
                            '财富全景图为您提供在建设银行的相关资产情况，包括活期存款、定期存款、理财产品、基金（含公募基金、专户理财）、（原）组合策略（含（原）龙智投、龙智选）、贵金属（含账户贵金属、代理贵金属、易存金、黄金积存、实物贵金属产品仅统计待提取实物贵金属）、保险、信托产品、债券、产品组合（含增值保）、账户商品、账户外汇、在途资金等，数据仅供参考，不作为对账凭据。如果您持有外币形式的资产，将会折算成人民币计算，因汇率实时变动，请以实际行情为准。参考市值中投资类信托产品以持有份额*最新净值为依据，其他类型信托产品以初始购买金额为依据，兑付金额以信托公司实际兑付金额为准，我行不承担兑付代理信托产品本息的职责。贵金属价格以建行提供的价格计算，计算口径与相应产品功能页面一致。保险中保单信息仅供参考。',
                            style: TextStyle(
                                fontFamily: 'PingFangSC',
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                height: 1.4,
                                color: Color(0xFF535353))),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          width: 0.8.sw - 40.w,
                          height: 40.w,
                          child: SizedBox(width: 0.8.sw, height: 40.w)
                              .withOnTap(onTap: () {
                            SmartDialog.dismiss();
                          })),
                    ],
                  ),
                )
              ]);
        },
      );
    });
  }

  Widget _addToolYesterdayTipDialog() {
    return Image(
      image: 'ic_tooltip'.png3x,
      width: 12.w,
      height: 12.w,
    ).withPadding(left: 5.w).withOnTap(onTap: () {
      SmartDialog.show(
        usePenetrate: false,
        clickMaskDismiss: false,
        builder: (_) {
          return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 0.8.sw,
                  child: Image(
                    image: "yesterday_tip".png,
                    fit: BoxFit.fitWidth,
                  ).withOnTap(onTap: () {
                    SmartDialog.dismiss();
                  }),
                )
              ]);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF327DE8)
          // image: DecorationImage(
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
          children: [
            GetBuilder(
              builder: (AccountPreviewLogic c) {
                StackPosition position = StackPosition(
                    designWidth: 1080, designHeight: 382, deviceWidth: 1.sw);
                return Stack(
                  children: [
                    // 根据 segment 切换背景图片
                    Container(
                      width: 1.sw,
                      child: Image(
                        image: segment == 1
                            ? "bg_account_preview_segment_1".png3x
                            : "bg_account_preview_segment_2".png3x,
                        fit: BoxFit.fitWidth,
                        gaplessPlayback: true,
                      ),
                    ),
                    // 切换按钮 - segment=1 时在右边，segment=2 时在左边
                    Positioned(
                        right: segment == 1 ? 0 : null,
                        left: segment == 1 ? null : 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: toggleSegment,
                          child: Container(
                            width: 120.w,
                            height: 120.w,
                            color: Colors.transparent,
                          ),
                        )),

                    // SEGMENT1: 总资产内容 - 仅在 segment=1 时显示
                    if (segment == 1) ...[
                      Positioned(
                          left: position.getX(80),
                          top: position.getY(125),
                          child: _balanceText(
                            text: "￥${(c.state.accountViewModel?.balance ?? 0)
                                .bankBalance}",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Number",
                                height: 1.0,
                                color: Colors.black),
                          )),
                      Positioned(
                          left: position.getX(735),
                          top: position.getY(183),
                          child: _balanceText(
                            text: "￥0.00",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                height: 1.0,
                                color: Colors.white),
                          )),
                    ],

                    // SEGMENT2: 总负债内容 - 仅在 segment=2 时显示
                    if (segment == 2) ...[
                      Positioned(
                          left: position.getX(40),
                          top: position.getY(196),
                          child: _balanceText(
                            text: "￥${(c.state.accountViewModel?.balance ?? 0)
                                .bankBalance}",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                height: 1.0,
                                color: Colors.white),
                          )),
                      Positioned(
                          left: position.getX(400),
                          top: position.getY(125),
                          child: _balanceText(
                            text: "￥0.00",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Number",
                                height: 1.0,
                                color: Colors.black),
                          )),
                    ],
                  ],
                );
              },
              id: 'updateAccountView',
            ),

            // 根据 segment 切换图片

            // 根据 segment 切换显示总资产或总负债详情
            segment == 1 ? balanceWidget() : debtWidget(),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: infoDataList.map((e) {
            //     return Column(
            //       children: [
            //         Image(
            //           image: '${e['image']}'.png3x,
            //           width: 25.w,
            //           height: 25.w,
            //         ),
            //         SizedBox(
            //           height: 6.w,
            //         ),
            //         BaseText(
            //           text: e['name'],
            //           style: TextStyle(
            //               fontSize: 12.sp,
            //               fontWeight: FontWeight.w500,
            //               fontFamily: "PingFangSC"),
            //         )
            //       ],
            //     ).withOnTap(onTap: () {
            //       jumpPage(e['name']);
            //     });
            //   }).toList(),
            // ).withContainer(
            //   decoration: const BoxDecoration(
            //     color: Colors.white, //const Color(0xffF6F6F6),
            //   ),
            // ),
            // Container(
            //   height: 15.w,
            //   color: Colors.white,
            // ),
            // GetBuilder(
            //   builder: (AccountPreviewLogic c) {
            //     return Container(
            //       width: 1.sw,
            //       height: 80.w,
            //       // margin: EdgeInsets.only(left: 12.w,right: 12.w),
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //       ),
            //       child: Row(
            //         children: [
            //           Expanded(
            //               child: Container(
            //             alignment: Alignment.center,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 BaseText(
            //                   text: (c.state.accountViewModel?.balance ?? 0)
            //                       .bankBalance,
            //                   style: TextStyle(
            //                     fontSize: 13.sp,
            //                     fontWeight: FontWeight.w500,
            //                     color: c.selectData == '1'
            //                         ? const Color(0xFF3040A5)
            //                         : const Color(0xff333333),
            //                   ),
            //                 ),
            //                 BaseText(
            //                   text: '活期',
            //                   style: TextStyle(
            //                     fontSize: 13.sp,
            //                     fontWeight: FontWeight.w500,
            //                     color: c.selectData == '1'
            //                         ? const Color(0xFF3040A5)
            //                         : const Color(0xff333333),
            //                   ),
            //                 ).withPadding(
            //                   top: 4.w,
            //                   bottom: 4.w,
            //                 ),
            //                 c.selectData == '1'
            //                     ? Container(
            //                         width: 25.w,
            //                         height: 3.w,
            //                         decoration: BoxDecoration(
            //                             color: c.selectData == '1'
            //                                 ? const Color(0xFF3040A5)
            //                                 : const Color(0xff333333),
            //                             borderRadius: BorderRadius.all(
            //                                 Radius.circular(1.5.w))),
            //                       )
            //                     : const SizedBox.shrink(),
            //               ],
            //             ).withOnTap(onTap: () => c.changeSelect('1')),
            //           )),
            //           Expanded(
            //               child: Container(
            //             alignment: Alignment.center,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 BaseText(
            //                   text: '--',
            //                   style: TextStyle(
            //                     fontSize: 13.sp,
            //                     fontWeight: FontWeight.w500,
            //                     color: c.selectData == '2'
            //                         ? const Color(0xFF3040A5)
            //                         : const Color(0xff333333),
            //                   ),
            //                 ),
            //                 BaseText(
            //                   text: '持仓总额',
            //                   style: TextStyle(
            //                     fontSize: 13.sp,
            //                     fontWeight: FontWeight.w500,
            //                     color: c.selectData == '2'
            //                         ? const Color(0xFF3040A5)
            //                         : const Color(0xff333333),
            //                   ),
            //                 ).withPadding(
            //                   top: 4.w,
            //                   bottom: 4.w,
            //                 ),
            //                 c.selectData == '2'
            //                     ? Container(
            //                         width: 25.w,
            //                         height: 3.w,
            //                         decoration: BoxDecoration(
            //                             color: c.selectData == '2'
            //                                 ? const Color(0xFF3040A5)
            //                                 : const Color(0xff333333),
            //                             borderRadius: BorderRadius.all(
            //                                 Radius.circular(1.5.w))),
            //                       )
            //                     : const SizedBox.shrink(),
            //               ],
            //             ).withOnTap(onTap: () => c.changeSelect('2')),
            //           )),
            //         ],
            //       ),
            //     );
            //   },
            //   id: 'changeSelect',
            // ),
            // Container(
            //   height: 12.w,
            //   decoration: BoxDecoration(
            //     color: const Color(0xffF6F6F6),
            //     border: Border.all(
            //       width: 0,
            //       color: const Color(0xffF6F6F6),
            //     ),
            //   ),
            // ),
            // RichText(
            //   text: TextSpan(
            //     children: <TextSpan>[
            //       TextSpan(
            //           text: '资产',
            //           style: TextStyle(
            //               fontSize: 16.sp,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.black)),
            //       TextSpan(
            //           text: '(含外币折合)',
            //           style: TextStyle(color: Colors.black, fontSize: 12.sp)),
            //     ],
            //   ),
            // ).withPadding(left: 12.w, right: 12.w).withContainer(
            //       color: const Color(0xffF6F6F6),
            //     ),
            // Container(
            //   height: 12.w,
            //   decoration: BoxDecoration(
            //     color: const Color(0xffF6F6F6),
            //     border: Border.all(
            //       width: 0,
            //       color: const Color(0xffF6F6F6),
            //     ),
            //   ),
            // ),
            // GetBuilder(
            //   builder: (AccountPreviewLogic c) {
            //     return _itemCell(
            //       '活期',
            //       (c.state.accountViewModel?.balance ?? 0).bankBalance,
            //       show: c.showMore,
            //     )
            //         .withPadding(left: 12.w, right: 12.w)
            //         .withContainer(
            //           color: const Color(0xffF6F6F6),
            //         )
            //         .withOnTap(onTap: () {
            //       c.changeShowMore(!c.showMore);
            //     });
            //   },
            //   id: 'updateCell',
            // ),
            // Container(
            //   height: 8.w,
            //   color: const Color(0xffF6F6F6),
            // ),
            // Container(
            //   width: 350.w,
            //   // decoration: BoxDecoration(
            //   //     color: Colors.white,
            //   //     borderRadius: BorderRadius.all(Radius.circular(8.w))),
            //   child: Column(
            //     children: [
            //       _itemCell('持仓总额', '¥--'),
            //       Container(
            //         height: 10.w,
            //         color: const Color(0xffF6F6F6),
            //       ),
            //       _itemCell('龙钱宝1号', '零钱理财、能赚还能花', onTap: () {
            //         Get.toNamed(Routes.changeNavPage, arguments: {
            //           'title': '龙钱包1号',
            //           'image': 'bg_lqb1h',
            //           'defTitleColor': Colors.black
            //         });
            //       }),
            //       Container(
            //         height: 10.w,
            //         color: const Color(0xffF6F6F6),
            //       ),
            //       _itemCell('龙钱宝2号', '灵活交易超省心', onTap: () {
            //         Get.toNamed(Routes.changeNavPage, arguments: {
            //           'title': '龙钱包2号',
            //           'image': 'bg_lqb2h',
            //           'defTitleColor': Colors.black
            //         });
            //       }),
            //       Container(
            //         height: 10.w,
            //         color: const Color(0xffF6F6F6),
            //       ),
            //       _itemCell('存款产品', '起存点低、安全稳健', onTap: () {
            //         Get.toNamed(Routes.changeNavPage, arguments: {
            //           'title': '存款产品',
            //           'image': 'bg_ckcp',
            //         });
            //       }),
            //       Container(
            //         height: 10.w,
            //         color: const Color(0xffF6F6F6),
            //       ),
            //       _itemCell('基金', '优选基金、一元起投', onTap: () {
            //         Get.toNamed(Routes.changeNavPage, arguments: {
            //           'title': '基金投资',
            //           'image': 'bg_jjtz',
            //         });
            //       }),
            //       Container(
            //         height: 10.w,
            //         color: const Color(0xffF6F6F6),
            //       ),
            //       _itemCell('理财产品', '理财有方、稳重求进', onTap: () {
            //         Get.toNamed(Routes.changeNavPage, arguments: {
            //           'title': '理财产品',
            //           'image': 'bg_lccp',
            //         });
            //       }),
            //       Container(
            //         height: 10.w,
            //         color: const Color(0xffF6F6F6),
            //       ),
            //       _itemCell('保险', '多重保障、关爱生命', onTap: () {
            //         Get.toNamed(Routes.changeNavPage, arguments: {
            //           'title': '保险',
            //           'image': 'bg_baoxian',
            //         });
            //         return;
            //       }),
            //     ],
            //   ),
            // ).withContainer(
            //   padding: EdgeInsets.only(left: 12.w, right: 12.w),
            //   color: const Color(0xffF6F6F6),
            // ),
            // Container(
            //   height: 55.w,
            //   color: const Color(0xffF6F6F6),
            // ),
            // Container(
            //   width: 1.sw,
            //   height: 31.w,
            //   alignment: Alignment.center,
            //   color: const Color(0xffF6F6F6),
            //   child: Image(
            //     image: 'ic_a_p_log'.png3x,
            //     width: 181.w,
            //     height: 31.w,
            //   ),
            // ),
            // Container(
            //   height: ScreenUtil().bottomBarHeight + 15.w,
            //   color: const Color(0xffF6F6F6),
            // ),
          ],
        ),
      ),
    );
  }

  /// 金额文本，配合小眼睛隐藏
  Widget _balanceText({
    required String text,
    required TextStyle style,
    TextAlign? textAlign,
  }) {
    return GetBuilder<BalanceLogic>(
      id: 'updateBalance',
      builder: (c) {
        return BaseText(
          text: c.showValue.value ? text : "***",
          style: style,
          textAlign: textAlign,
        );
      },
    );
  }

  /// 总资产详情
  balanceWidget() {
    return GetBuilder<AccountPreviewLogic>(builder: (c) {
      StackPosition positionBody = StackPosition(
          designWidth: 1080, designHeight: 3204, deviceWidth: 1.sw);
      StackPosition bgPosition =
          StackPosition(designWidth: 965, designHeight: 551, deviceWidth: 1.sw);
      return Container(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image(
                      image: "bg_account_preview_1_view_more".png3x,
                      width: 1.sw,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                        left: bgPosition.getX(175),
                        top: bgPosition.getY(347),
                        child: Container(
                          width: bgPosition.getY(200),
                          alignment: Alignment.center,
                          child: _balanceText(
                            text: (c.state.accountViewModel?.balance ?? 0)
                                .bankBalance,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                height: 1.0,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                        )),
                    Positioned(
                        left: bgPosition.getX(510),
                        top: bgPosition.getY(250),
                        child: _balanceText(
                          text: (c.state.accountViewModel?.balance ?? 0)
                              .bankBalance,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              height: 1.0,
                              color: Colors.white.withOpacity(0.8)),
                        )),
                  ],
                ),
                Container(
                  height: 20.w,
                  width: 1.sw,
                  color: Color(0xFF3363DC),
                )
              ],
            ),
            Transform.translate(
              offset: Offset(0, _balanceDetailExpanded ? 220.w : 25.w),
              child: Stack(
                children: [
                  Image(
                    image: "bg_account_preview_1_view".png3x,
                    width: 1.sw,
                    fit: BoxFit.fitWidth,
                  ),
                  // 活钱
                  Positioned(
                      left: positionBody.getX(500),
                      top: positionBody.getY(72),
                      child: _balanceText(
                        text: "￥${(c.state.accountViewModel?.balance ?? 0)
                            .bankBalance}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Number",
                            height: 1.0,
                            color: Color(0xFF094FC7)),
                      )),
                  // 直接可用
                  Positioned(
                      right: 25.w,
                      top: positionBody.getY(220),
                      child: _balanceText(
                        text: (c.state.accountViewModel?.balance ?? 0)
                            .bankBalance,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Number",
                            height: 1.0,
                            color: Colors.black),
                      )),
                  // 活期余额
                  Positioned(
                      right: 40.w,
                      top: positionBody.getY(360),
                      child: _balanceText(
                        text: (c.state.accountViewModel?.balance ?? 0)
                            .bankBalance,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Number",
                            height: 1.0,
                            color: Colors.black),
                      )),

                  // 龙钱宝1号
                  Positioned(
                      top: positionBody.getY(420),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.changeNavPage, arguments: {
                            'title': '龙钱包1号',
                            'image': 'bg_lqb1h',
                            'defTitleColor': Colors.black
                          });
                        },
                        child: Container(
                          width: 1.sw,
                          height: 40.w,
                          color: Colors.transparent,
                        ),
                      )),
                  // 龙钱宝2号
                  Positioned(
                      top: positionBody.getY(720),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.changeNavPage, arguments: {
                            'title': '龙钱包2号',
                            'image': 'bg_lqb2h',
                            'defTitleColor': Colors.black
                          });
                        },
                        child: Container(
                          width: 1.sw,
                          height: 40.w,
                          color: Colors.transparent,
                        ),
                      )),

                  // 理财产品 基金 存款产品
                  StackPositionGridWidget(
                    stackPosition: positionBody,
                    designX: 0,
                    designY: 1043,
                    bottomMargin: 1600,
                    crossCount: 1,
                    itemCount: 3,
                    onItemTap: (index) {
                      if (index == 0) {
                        Get.toNamed(Routes.changeNavPage, arguments: {
                          'title': '理财产品',
                          'image': 'bg_lccp',
                        });
                      } else if (index == 1) {
                        Get.toNamed(Routes.changeNavPage, arguments: {
                          'title': '基金投资',
                          'image': 'bg_jjtz',
                        });
                      } else if (index == 2) {
                        Get.toNamed(Routes.changeNavPage, arguments: {
                          'title': '存款产品',
                          'image': 'bg_ckcp',
                        });
                      }
                    },
                  ).build(),

                  // 社保 医保 公积金 证券期货
                  StackPositionGridWidget(
                    stackPosition: positionBody,
                    designX: 68,
                    rightMargin: 68,
                    designY: 1752,
                    bottomMargin: 1237,
                    crossCount: 4,
                    itemCount: 4,
                    onItemTap: (index) {
                      if (index == 0) {
                        Get.toNamed(Routes.sheBao);
                      } else if (index == 1) {
                        Get.toNamed(Routes.yibaodianzi);
                      } else if (index == 2) {
                        Get.toNamed(Routes.gongjijin);
                      } else if (index == 3) {
                        Get.toNamed(Routes.changeNavPage, arguments: {
                          'title': '交易',
                          'image': 'bg_zqqh',
                        });
                      }
                    },
                  ).build()
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _balanceDetailExpanded = !_balanceDetailExpanded;
                    });
                  },
                  child: Container(
                    width: 1.sw,
                    height: 35.w,
                    color: Colors.transparent,
                  ),
                ))
          ],
        ),
      );
    });
  }

  /// 总负债详情
  debtWidget() {
    StackPosition positionBody =
        StackPosition(designWidth: 1080, designHeight: 3204, deviceWidth: 1.sw);
    StackPosition bgPosition =
        StackPosition(designWidth: 965, designHeight: 551, deviceWidth: 1.sw);
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: "bg_account_preview_2_view_more".png3x,
                    width: 1.sw,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                      left: bgPosition.getX(175),
                      top: bgPosition.getY(347),
                      child: Container(
                        width: bgPosition.getY(200),
                        alignment: Alignment.center,
                        child: _balanceText(
                          text: "0.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              height: 1.0,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                      )),
                ],
              ),
              Container(
                height: 20.w,
                width: 1.sw,
                color: Color(0xFF3363DC),
              )
            ],
          ),
          Transform.translate(
            offset: Offset(0, _debtDetailExpanded ? 220.w : 25.w),
            child: Stack(
              children: [
                Image(
                  image: "bg_account_preview_2_view".png3x,
                  width: 1.sw,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                    right: 40.w,
                    top: positionBody.getY(338),
                    child: _balanceText(
                      text: "0.00",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Number",
                          height: 1.0,
                          color: Colors.black),
                    )),
                Positioned(
                    right: 40.w,
                    top: positionBody.getY(465),
                    child: _balanceText(
                      text: "0.00",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Number",
                          height: 1.0,
                          color: Colors.black),
                    )),
              ],
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _debtDetailExpanded = !_debtDetailExpanded;
                  });
                },
                child: Container(
                  width: 1.sw,
                  height: 35.w,
                  color: Colors.transparent,
                ),
              )),

          // 建信福袋\经营快贷\中德住房储蓄\公积金贷款
          StackPositionGridWidget(
            stackPosition: positionBody,
            designX: 68,
            rightMargin: 68,
            designY: 1550,
            bottomMargin: 1337,
            crossCount: 4,
            itemCount: 4,
            onItemTap: (index) {
              if (index == 0) {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '首页',
                  'image': 'bg_jxfd',
                });
              } else if (index == 1) {
                // 经营快贷
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '快贷',
                  'image': 'bg_grjykd',
                });
              } else if (index == 2) {
                // 中德住房储蓄
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '中德住房储蓄',
                  'image': 'bg_zdzfcx',
                });
              } else if (index == 3) {
                // 公积金贷款
                Get.toNamed(Routes.gongjijin);
              }
            },
          ).build()

        ],
      ),
    );
  }

  Widget _itemCell(String title, String content,
      {Function? onTap, bool show = false}) {
    Color textColor = title == '持仓总额' || title == '活期'
        ? Colors.black
        : const Color(0xff666666);
    FontWeight textFont =
        title == '持仓总额' || title == '活期' ? FontWeight.bold : FontWeight.w600;

    double fontSize = title == '持仓总额' || title == '活期' ? 16.sp : 15.sp;
    return Container(
      width: 350.w,
      height: title == '持仓总额'
          ? 40.w
          : show
              ? (title == '活期' ? 100 : 50.w)
              : 50.w,
      padding: EdgeInsets.only(
        left: title == '持仓总额' ? 0.w : 12.w,
        right: 12.w,
        top: title == '持仓总额' ? 6.w : 0.w,
      ),
      decoration: BoxDecoration(
          color: title == '持仓总额' ? const Color(0xffF6F6F6) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BaseText(
                    text: title,
                    style: TextStyle(
                      fontWeight: textFont,
                      fontSize: fontSize,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  if (title == '活期')
                    Image(
                      image: show ? 'ic_mx_sx1_2'.png3x : 'ic_mx_sx1'.png3x,
                      width: 10.w,
                      height: 10.w,
                    )
                ],
              ),
              title == '持仓总额'
                  ? const SizedBox.shrink()
                  : Row(
                      children: [
                        BaseText(
                          text: content,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: textColor,
                              fontWeight: FontWeight.w600),
                          color: textColor,
                        ),
                        if (title != '持仓总额')
                          const Icon(
                            Icons.navigate_next_sharp,
                            color: Color(0xff666666),
                          )
                      ],
                    ).withOnTap(onTap: onTap)
            ],
          ).withSizedBox(height: title == '持仓总额' ? 30.w : 50.w),
          if (title == '活期' && show)
            GetBuilder(
              builder: (AccountPreviewLogic c) {
                return Container(
                  height: 45.w,
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        text:
                            '尾号${AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard.getLastFourByList()}',
                        fontSize: 14.sp,
                      ),
                      Row(
                        children: [
                          BaseText(
                            text: content,
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          const Icon(
                            Icons.navigate_next_sharp,
                            color: Color(0xff666666),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              id: 'updateCell',
            )
        ],
      ),
    );
  }
}

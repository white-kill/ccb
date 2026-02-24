import 'package:card_swiper/card_swiper.dart';
import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/text_style_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../data/model/member_info_entity.dart';
import '../../../../../routes/app_pages.dart';
import 'card_detail_logic.dart';
import 'card_detail_state.dart';

class CardDetailPage extends BaseStateless {
  CardDetailPage({Key? key}) : super(key: key, title: '银行卡详情');

  final CardDetailLogic logic = Get.put(CardDetailLogic());
  final CardDetailState state = Get.find<CardDetailLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Color? get backColor => Colors.white;

  @override
  bool get noBackGround1 => false;

  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return Column(
      children: [
        Container(
          height: navHeight,
          width: 1.sw,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 4.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'bg_account_preview_top1'.png3x,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25.w, right: 25.w),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.w),
                      ),
                      image: DecorationImage(
                        image: 'bg_card_info'.png3x,
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 150.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 12.w),
                        Image(
                          image: 'ic_jsyh'.png3x,
                          width: 45.w,
                          height: 45.w,
                        ),
                        SizedBox(width: 6.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GetBuilder(
                                  builder: (BalanceLogic c) {
                                    return c.cardInfoWidget();
                                  },
                                  id: 'updateUI',
                                ),
                                BaseText(
                                  text: '查看卡号',
                                  fontSize: 12.sp,
                                  color: const Color(0xff5489F0),
                                ).withOnTap(onTap: () {
                                  SmartDialog.show(
                                    usePenetrate: false,
                                    clickMaskDismiss: false,
                                    builder: (_) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 1.sw * 0.88,
                                              constraints: BoxConstraints(
                                                  minHeight: 100.w),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(8.w),
                                                  topLeft: Radius.circular(8.w),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 24.w,
                                                  ),
                                                  BaseText(
                                                    text: state
                                                        .infoModel.bankCard,
                                                    fontSize: 14.sp,
                                                  ),
                                                  SizedBox(
                                                    height: 10.w,
                                                  ),
                                                  BaseText(
                                                    text: state
                                                        .infoModel.openOutlets,
                                                    maxLines: 5,
                                                    textAlign: TextAlign.center,
                                                    fontSize: 14.sp,
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
                                                bottomRight:
                                                    Radius.circular(8.w),
                                                bottomLeft:
                                                    Radius.circular(8.w),
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
                                                  logic.copyToClipboard(
                                                      '${state.infoModel.bankCard} ${state.infoModel.openOutlets}');
                                                  SmartDialog.dismiss();
                                                })),
                                                Container(
                                                  width: 0.5.w,
                                                  height: 42.w,
                                                  color:
                                                      const Color(0xffbbbbab),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  alignment: Alignment.center,
                                                  child: (const BaseText(
                                                    text: '仅复制卡号',
                                                    color: Colors.blueAccent,
                                                  )),
                                                ).withOnTap(onTap: () {
                                                  logic.copyToClipboard(
                                                      state.infoModel.bankCard);
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
                            Row(
                              children: [
                                Image(
                                  image: 'ic_bm_01'.png3x,
                                  width: 15.w,
                                  height: 15.w,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                BaseText(
                                  text: '修改别名',
                                  fontSize: 12.sp,
                                  color: const Color(0xff999999),
                                ).withOnTap(onTap: () {
                                  logic.changeName();
                                }),
                                SizedBox(
                                  width: 6.w,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xff5489F0).withOpacity(0.2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.w))),
                                  width: 22.w,
                                  height: 12.w,
                                  child: BaseText(
                                    text: '正常',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff5489F0),
                                        // height: 1,
                                        fontSize: 9.sp),
                                  ),
                                ),
                                // Image(
                                //   image: 'ic_bm_02'.png3x,
                                //   width: 15.w,
                                //   height: 15.w,
                                // ),
                              ],
                            ).withPadding(top: 4.w),
                            SizedBox(
                              height: 24.w,
                            ),
                            BaseText(
                              text: '卡片类型：龙卡通',
                              fontSize: 10.sp,
                              color: Color(0xff666666),
                            ),
                            SizedBox(
                              height: 6.w,
                            ),
                            BaseText(
                              text: '账户类别：I类户',
                              fontSize: 10.sp,
                              color: Color(0xff666666),
                            ),
                            SizedBox(
                              height: 6.w,
                            ),
                            BaseText(
                              text: '开户网点：${state.infoModel.openOutlets}',
                              fontSize: 10.sp,
                              color: Color(0xff666666),
                            ),
                            // SizedBox(
                            //   height: 6.w,
                            // ),
                            // BaseText(
                            //   text: '绑定账户：${state.infoModel.bankCard.maskBankCardNumber()}',
                            //   fontSize: 10.sp,
                            //   color: Color(0xff666666),
                            // ),
                            // SizedBox(
                            //   height: 6.w,
                            // ),
                            // BaseText(
                            //   text: '绑定手机：${AppConfig.config.balanceLogic.memberInfo.phone.desensitize()}',
                            //   fontSize: 10.sp,
                            //   color: Color(0xff666666),
                            // )
                          ],
                        )
                      ],
                    ).withPadding(
                      top: 12.w,
                    ),
                  ),
                  Positioned(
                      right: 5,
                      bottom: 10,
                      child: InkWell(
                        onTap: () {
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
                                      constraints:
                                          BoxConstraints(minHeight: 100.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8.w),
                                          topLeft: Radius.circular(8.w),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.sp,
                                                vertical: 16),
                                            child: BaseText(
                                              text:
                                                  '本台设备不是您唯一绑定的设备，为保证您的资金安全，暂不支持扫码办服务。如需变更绑定设备，请点击下方“咨询客服”，输入“半绑定”关键词查看解决方案。',
                                              maxLines: 100,
                                              fontSize: 13.sp,
                                              style: TextStyle(height: 1.5),
                                            ),
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
                                            text: '返回',
                                            color: Color(0xFF999999),
                                          )),
                                        ).withOnTap(onTap: () {
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
                                            text: '咨询客服',
                                            color: Colors.blueAccent,
                                          )),
                                        ).withOnTap(onTap: () {
                                          SmartDialog.dismiss();
                                          Get.toNamed('/ccbCustomerPage');
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
                        },
                        child: const SizedBox(
                          width: 60,
                          height: 60,
                        ),
                      ))
                  // Positioned(
                  //     right: 0,
                  //     top: 0,
                  //     child: Image(
                  //       image: 'ic_kxx_right'.png3x,
                  //       width: 36.w,
                  //       height: 36.w,
                  //     ))
                ],
              ),
            ).withContainer(
                width: 1.sw,
                color: const Color(0xff3A5ECC),
                padding: EdgeInsets.only(top: 15.w, bottom: 15.w)),
            Container(
              color: Color(0xff3A5ECC),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.w),
                    topLeft: Radius.circular(8.w),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.kuaijiezhifu);
                      },
                      child: _containerWidget(
                          height: 50.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BaseText(
                                text: "快捷支付",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.sp,
                                ),
                              ).withPadding(
                                left: 12.w,
                              ),
                              Row(
                                children: [
                                  Image(
                                    image: 'ic_wx'.png3x,
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Image(
                                    image: 'ic_zfb'.png3x,
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Image(
                                    image: 'ic_zh_mx_next'.png3x,
                                    width: 20.w,
                                    height: 20.w,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    _containerWidget(
                        height: 101.w,
                        child: Column(
                          children: [
                            Container(
                              height: 50.w,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 12.w),
                              child: Container(
                                width: 75.w,
                                height: 30.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.w)),
                                  color: const Color(0xffECF3FD),
                                ),
                                child: BaseText(
                                  text: '活期储蓄',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: const Color(0xff3C6DD3),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: const Color(0xffE7E9EB),
                              height: 1.w,
                            ),
                            Container(
                              height: 50.w,
                              padding: EdgeInsets.only(left: 12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BaseText(
                                    text: "人民币",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.accountDetail);
                                        },
                                        child: BaseText(
                                          text: AppConfig.config.balanceLogic
                                              .balance(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Image(
                                        image: 'ic_zh_mx_next'.png3x,
                                        width: 20.w,
                                        height: 20.w,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    // _containerWidget(
                    //     height: 140.w,
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         BaseText(
                    //           text: "出入金剩余额度",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w600,
                    //               fontSize: 17.sp,
                    //               color: const Color(0xff272829)),
                    //         ),
                    //         SizedBox(
                    //           height: 10.w,
                    //         ),
                    //         BaseText(
                    //           text: '(含非绑定账户转账、现金存取、消费缴费)',
                    //           fontSize: 12.sp,
                    //           color: Color(0xff272829),
                    //         ),
                    //         SizedBox(
                    //           height: 12.w,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //                 child: Container(
                    //               child: Row(
                    //                 children: [
                    //                   BaseText(
                    //                     text: "日出金：",
                    //                     fontSize: 12.sp,
                    //                     color: Color(0xff272829),
                    //                   ),
                    //                   BaseText(
                    //                     text: "￥500000.00",
                    //                     fontSize: 12.sp,
                    //                     color: Colors.red,
                    //                   )
                    //                 ],
                    //               ),
                    //             )),
                    //             Expanded(
                    //                 child: Container(
                    //               child: Row(
                    //                 children: [
                    //                   BaseText(
                    //                     text: "日入金：",
                    //                     fontSize: 12.sp,
                    //                     color: Color(0xff272829),
                    //                   ),
                    //                   BaseText(
                    //                     text: "￥500000.00",
                    //                     fontSize: 12.sp,
                    //                     color: Colors.red,
                    //                   )
                    //                 ],
                    //               ),
                    //             ))
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: 10.w,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //                 child: Container(
                    //               child: Row(
                    //                 children: [
                    //                   BaseText(
                    //                     text: "年出金：",
                    //                     fontSize: 12.sp,
                    //                     color: Color(0xff272829),
                    //                   ),
                    //                   BaseText(
                    //                     text: "￥500000.00",
                    //                     fontSize: 12.sp,
                    //                     color: Colors.red,
                    //                   )
                    //                 ],
                    //               ),
                    //             )),
                    //             Expanded(
                    //                 child: Container(
                    //               child: Row(
                    //                 children: [
                    //                   BaseText(
                    //                     text: "年入金：",
                    //                     fontSize: 12.sp,
                    //                     color: Color(0xff272829),
                    //                   ),
                    //                   BaseText(
                    //                     text: "￥500000.00",
                    //                     fontSize: 12.sp,
                    //                     color: Colors.red,
                    //                   )
                    //                 ],
                    //               ),
                    //             ))
                    //           ],
                    //         ),
                    //       ],
                    //     ).withPadding(left: 16.w, top: 12.w)),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: screenWidth,
                          height: screenWidth / 3245 * 2577,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: 'ic_card_detail_gl'.png3x,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ).withPadding(bottom: ScreenUtil().bottomBarHeight),
                        Positioned(
                            top: screenWidth / 3245 * 2577 * 0.15,
                            child: SizedBox(
                              height: screenWidth / 3245 * 2577 * 0.2,
                              width: screenWidth,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container().withOnTap(onTap: () {
                                    Get.toNamed(Routes.xesz);
                                  })),
                                  Expanded(
                                      child: Container().withOnTap(onTap: () {
                                    AppPages.toPrintView();
                                  })),
                                  Expanded(
                                      child: Container().withOnTap(onTap: () {
                                    Get.toNamed(Routes.khhcx);
                                  })),
                                  Expanded(
                                      child: Container().withOnTap(onTap: () {
                                    Get.toNamed(Routes.zhgs);
                                  })),
                                  Expanded(
                                      child: Container().withOnTap(onTap: () {
                                    Get.toNamed(Routes.yyhk);
                                  })),
                                ],
                              ),
                            )),
                        Positioned(
                          top: screenWidth / 3245 * 2577 * 0.35,
                          child: SizedBox(
                            height: screenWidth / 3245 * 2577 * 0.2,
                            width: screenWidth,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  Get.toNamed(Routes.aqs);
                                })),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  Get.toNamed(Routes.zhsjj);
                                })),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  Get.toNamed(Routes.gljwjy);
                                })),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  Get.toNamed(Routes.wkqk);
                                })),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  Get.toNamed(Routes.yhkxqgd);
                                })),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ))
      ],
    );
  }

  Widget _containerWidget({Widget? child, double? height}) {
    return Container(
      width: 350.w,
      height: height,
      margin: EdgeInsets.only(top: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
      ),
      child: child,
    );
  }
}

import 'package:ccb/pages/tabs/mine/account_money_transfer/item1_widget.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/item2_widget.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import 'account_money_transfer_logic.dart';
import 'account_money_transfer_state.dart';

class AccountMoneyTransferView extends BaseStateless {
  AccountMoneyTransferView({super.key})
      : super(
          title: "转账汇款",
        );

  final AccountMoneyTransferLogic logic = Get.put(AccountMoneyTransferLogic());
  final AccountMoneyTransferState state =
      Get.find<AccountMoneyTransferLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildTopWidget(),
        // Container(
        //   width: 350.w,
        //   height: 177.w,
        //   margin: EdgeInsets.only(top: 20.w, left: 12.w, right: 12.w),
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: 'bg_m_t_top'.png3x,
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        //   child: Column(
        //     children: [
        //       Expanded(
        //           child: Container(
        //         alignment: Alignment.center,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Image(
        //                   image: "ic_m_t_top_tag1".png3x,
        //                   width: 40.w,
        //                   height: 40.w,
        //                 ),
        //                 SizedBox(height:10.w),
        //                 BaseText(
        //                   text: '银行账号转账',
        //                   fontSize: 13.sp,
        //                   color: Colors.white,
        //                 ),
        //               ],
        //             ).withContainer(width: (350 / 2).w).withOnTap(onTap: (){
        //             }),
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Image(
        //                   image: "ic_m_t_top_tag2".png3x,
        //                   width: 40.w,
        //                   height: 40.w,
        //                 ),
        //                 SizedBox(height:10.w),
        //                 BaseText(
        //                   text: '手机号转账    ',
        //                   fontSize: 13.sp,
        //                   color: Colors.white,
        //                 ),
        //               ],
        //             ).withContainer(width: (350 / 2).w).withOnTap(onTap: (){

        //             }),
        //           ],
        //         ),
        //       )),
        //       SizedBox(
        //         height: 50.w,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             BaseText(
        //               text: '转账记录',
        //               fontSize: 14.sp,
        //               color: Colors.white,
        //             ).withPadding(left: 24.w).withOnTap(onTap: (){
        //
        //             }),
        //             BaseText(
        //               text: '转账设置',
        //               fontSize: 14.sp,
        //               color: Colors.white,
        //             ).withOnTap(onTap: (){
        //             }),
        //             BaseText(
        //               text: '绑定手机号',
        //               fontSize: 14.sp,
        //               color: Colors.white,
        //             ).withPadding(right: 24.w).withOnTap(onTap: (){
        //               Get.toNamed(Routes.bindPhonePage);
        //             }),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // Container(
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(8.w),
        //         topRight: Radius.circular(8.w),
        //       )),
        //   margin: EdgeInsets.only(left: 12.w, right: 12.w),
        //   child: Obx(() =>VerticalGridView(
        //     widgetBuilder: (_, index) {
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Image(
        //             image: '${state.getData(logic.showMore.value)[index]['image']}'.png3x,
        //             width: 30.w,
        //             height: 30.h,
        //           ),
        //           SizedBox(
        //             height: 12.w,
        //           ),
        //           BaseText(
        //             text: state.getData(logic.showMore.value)[index]['name'],
        //             maxLines: 2,
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //                 fontSize: 12.sp,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ],
        //       ).withOnTap(onTap: (){
        //         logic.jumpPage(index);
        //       });
        //     },
        //     itemCount: state.getData(logic.showMore.value).length,
        //     crossCount: 4,
        //     mainHeight: 80.w,
        //     spacing: 5.w,
        //   ).withContainer(
        //       padding: EdgeInsets.only(top: 20.w)
        //   )),
        // ),
        // Obx(()=> Container(
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(8.w),
        //         bottomRight: Radius.circular(8.w),
        //       )),
        //   margin: EdgeInsets.only(left: 12.w, right: 12.w),
        //   height: 25.w,
        //   child: Image(
        //     image: logic.showMore.value?'ic_m_t_less'.png3x:'ic_m_t_more'.png3x,
        //     width: 20.w,
        //     height: 20.w,
        //   ).withOnTap(onTap: (){
        //     logic.showMore.value = !logic.showMore.value;
        //   }),
        // )),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) return const Item1Widget();
            return const Item2Widget();
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 1.w,
              width: 311.w,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              color: const Color(0xffE7E9EB),
            );
          },
          itemCount: 2,
        ).withContainer(
          margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
          padding: EdgeInsets.only(bottom: 8.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.w),
              )),
        )
      ],
    );
  }

  buildTopWidget() {
    StackPosition position1 = StackPosition(
        designWidth: 3240, designHeight: 1506, deviceWidth: screenWidth);
    StackPosition position2 = StackPosition(
        designWidth: 3240, designHeight: 2376, deviceWidth: screenWidth);
    return Column(
      children: [
        Stack(
          children: [
            Image(
              image: 'account_trans_1'.png,
              width: screenWidth,
            ),
            StackPositionWidget(
                    stackPosition: position1,
                    designX: 203,
                    designY: 238,
                    designWidth: 769,
                    designHeight: 769)
                .build(onTap: () {
              Get.toNamed(Routes.accountTransferPage);
// 银行账号转账
            }),
            StackPositionWidget(
                    stackPosition: position1,
                    designX: 1261,
                    designY: 238,
                    designWidth: 769,
                    designHeight: 769)
                .build(onTap: () {
              Get.toNamed(Routes.accountTransferPage,
                  arguments: {'isPhone': true});
// 手机号转账
            }),
            StackPositionWidget(
                stackPosition: position1,
                designX: 2261,
                designY: 238,
                designWidth: 769,
                designHeight: 769).build(
                onTap: () {
              Get.toNamed(Routes.tahangzhuanru,
                  arguments: {'isPhone': true});
// 手机号转账
            }),
            StackPositionWidget(
                    stackPosition: position1,
                    designX: 3264,
                    designY: 238,
                    designWidth: 769,
                    designHeight: 769)
                .build(onTap: () {
// 他行
            }),
            StackPositionWidget(
                    stackPosition: position1,
                    designX: 151,
                    designY: 1123,
                    designWidth: 1510,
                    designHeight: 388)
                .build(onTap: () {
              Get.toNamed(Routes.transferRecordPage);
// 记录
            }),
            StackPositionWidget(
                    stackPosition: position1,
                    designX: 1611,
                    designY: 1123,
                    designWidth: 1510,
                    designHeight: 388)
                .build(onTap: () {
              Get.toNamed(Routes.transferSettingPage);
// 设置
            }),
          ],
        ),
        Obx(() {
          return Stack(
            children: [
              Image(
                image: 'account_trans_3'.png,
                width: screenWidth,
              ),
              logic.showMore.value == true
                  ? Image(
                      image: 'account_trans_2'.png,
                      width: screenWidth,
                    )
                  : SizedBox.shrink(),
              Positioned(
                  bottom: 0.w,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      logic.showMore.value = !logic.showMore.value;
                    },
                    child: Container(
                      width: screenWidth,
                      height: 50.w,
                    ),
                  )),

          VerticalGridView(
              widgetBuilder: (_, index) {
                return Container().withOnTap(onTap: (){
                  logic.jumpPage(state.allDataList[index]["name"]);
                });
              },
              itemCount: state.getData(logic.showMore.value).length,
              crossCount: 4,
              mainHeight: position2.getX(500),
              spacing: 5.w,
            ).paddingAll(10.w)
            ],
          );
        }),
      ],
    );
  }
}

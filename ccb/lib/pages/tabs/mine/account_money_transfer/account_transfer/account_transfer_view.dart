import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/component/contacts_transfer_widget.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/component/phone_transfer_widget.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/component/transfer_bottom_widget.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/component/transfer_info_widget.dart';
import 'package:ccb/pages/tabs/mine/account_money_transfer/account_transfer/component/transfer_remarks.dart';
import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'account_transfer_logic.dart';
import 'account_transfer_state.dart';
import 'component/card_transfer_widget.dart';

class AccountTransferPage extends BaseStateless {
  AccountTransferPage({super.key})
      : super(
          title: (Get.arguments?['isPhone'] ?? false) ? "手机号转账" : '转账',
        );

  final AccountTransferLogic logic = Get.put(AccountTransferLogic());
  final AccountTransferState state = Get.find<AccountTransferLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  List<Widget>? get rightAction => [
        Get.arguments?['bankModel'] != null
            ? BaseText(
                text: '转账记录',
                fontSize: 18.sp,
                color: Colors.white,
              ).withContainer(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 15.w)
        ).withOnTap(onTap: (){
          // print(Get.arguments?['bankModel'].bankCard??'');
          Get.toNamed(Routes.personTransferPage,arguments: {
            'oppositeAccount':Get.arguments?['bankModel'].bankCard??'',
          },);
        })
            :         ScalePointWidget(
          icColor: Colors.white,
          left: 80.w,
          dx: 35.w,
          dy: 10.w,
        ),
    SizedBox(
      width: 20,
    )
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (logic.model == null) ...widget1(),
        if (logic.model != null) ...widget2(),
        const TransferInfoWidget(),
        const TransferRemarks(),
        TransferBottomWidget(isPhone: Get.arguments?['isPhone'] ?? false,),
      ],
    );
  }

  List<Widget> widget1() {
    return [
      (Get.arguments?['isPhone'] ?? false)
          ? const PhoneTransferWidget()
          : const CardTransferWidget(),
      (Get.arguments?['isPhone'] ?? false)
          ? const SizedBox.shrink()
          : RichText(
              maxLines: 2,
              text: TextSpan(children: [
                TextSpan(
                    text: "不记得对方账号？试试",
                    style: TextStyle(
                      color: const Color(0xff9A9A9A),
                      fontSize: 12.sp,
                    )),
                TextSpan(
                    text: " 手机号转账",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12.sp,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAndToNamed(Routes.accountTransferPage,
                            arguments: {
                              'isPhone': true,
                            });
                      }),
              ]),
            ).withPadding(
              top: 8.w,
              left: 38.w,
              bottom: 10.w,
            ),
    ];
  }

  List<Widget> widget2() {
    return [
      const ContactsTransferWidget(),
      RichText(
        maxLines: 2,
        text: TextSpan(children: [
          TextSpan(
              text: "想修改对方信息？可从",
              style: TextStyle(
                color: const Color(0xff9A9A9A),
                fontSize: 12.sp,
              )),
          TextSpan(
              text: " 全部收款人",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.sp,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.contactsListPage);
                }),
          TextSpan(
              text: "查找替换",
              style: TextStyle(
                color: const Color(0xff9A9A9A),
                fontSize: 12.sp,
              )),
        ]),
      ).withPadding(
        top: 8.w,
        left: 38.w,
        bottom: 10.w,
      ),
    ];
  }
}

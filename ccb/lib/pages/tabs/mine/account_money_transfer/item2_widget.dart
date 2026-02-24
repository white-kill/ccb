import 'package:ccb/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../data/model/contacts_list_model.dart';
import '../../../../routes/app_pages.dart';
import 'account_money_transfer_logic.dart';

class Item2Widget extends StatefulWidget {
  const Item2Widget({super.key});

  @override
  State<Item2Widget> createState() => _Item2WidgetState();
}

class _Item2WidgetState extends State<Item2Widget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AccountMoneyTransferLogic c){
      return  ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {

          ContactsListModel model = c.state.contactsList[index];
          return Container(
            height: 64.w,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(width: 20.w),
                // Image(image: 'ic_jsyh'.png3x,width: 35.w,height: 35.w,),
                netImage(url: model.icon,width: 35.w,height: 35.w,),
                SizedBox(width: 6.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(text: model.name,color: Color(0xff333333),fontSize: 16,),
                    BaseText(text: "${model.bankName}（${model.bankCard.maskBankCardNumber()}）",color: Color(0xff333333),fontSize: 13,),
                  ],
                )
              ],
            ),
          ).withOnTap(onTap: (){
            // Get.toNamed(Routes.transferPagePage);
            Get.toNamed(Routes.accountTransferPage,arguments: {
              'bankModel':model
            });
          });
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1.w,
            width: 311.w,
            color: const Color(0xffE7E9EB),
          );
        },
        itemCount: c.state.contactsList.length,
      );
    },id: 'updateBanList',);

  }
}

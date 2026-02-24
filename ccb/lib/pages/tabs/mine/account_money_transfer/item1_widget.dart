import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../data/model/member_info_entity.dart';
import '../../../../routes/app_pages.dart';
import 'account_money_transfer_logic.dart';

class Item1Widget extends StatefulWidget {
  const Item1Widget({super.key});

  @override
  State<Item1Widget> createState() => _Item1WidgetState();
}

class _Item1WidgetState extends State<Item1Widget> {


  late MemberInfoModel infoModel;

  String sex = '';
  @override
  void initState() {
    super.initState();
    infoModel = AppConfig.config.balanceLogic.memberInfo;
    if(infoModel.sex == ''){
      sex = '1';
    }else{
      sex = infoModel.sex;
    }
  }


  String _maskName(String name) {
    if (name.isEmpty) return name;
    if (name.length == 1) return name;
    return '${'*' * (name.length - 1)}${name[name.length - 1]}';
  }

  Widget _buildShareReceiverBody(String maskedName, String maskedCard) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(
              image: 'share_receiver'.png3x,
              fit: BoxFit.fitWidth,
              width: 1.sw,
            ),
            Positioned(
              top: 36.w,
              left: 30.w,
              child: BaseText(
                text: maskedName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333),
                ),
              ),
            ),
            Positioned(
              top: 90.w,
              left: 140.w,
              child: BaseText(
                text: maskedCard,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool showItem = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AccountMoneyTransferLogic c){
      MemberInfoModel infoMode = AppConfig.config.balanceLogic.memberInfo;
      int allCount =infoMode.bankList.length + c.state.contactsList.length;
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 16.w, left: 20.w, right: 20.w,bottom:!showItem?20.w:0.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: "常用收款人",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BaseText(
                  text: "全部($allCount)",
                  fontSize: 14.sp,
                  color: Color(0xff878787),
                ),
              ],
            ),
            SizedBox(
              height: 30.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: 'ic_ccb_sex$sex'.png3x,width: 28.w,
                      height: 28.w,),
                    // Image(
                    //   image: 'ic_m_t_head'.png3x,
                    //   width: 25.w,
                    //   height: 25.w,
                    // ),
                    SizedBox(width: 8.w,),
                    BaseText(
                      text: infoMode.realName,
                      fontSize: 15.sp,
                    ),
                    SizedBox(width: 15.w,),
                    Image(image: 'share_receiver_tag'.png3x ,
                      height: 28.w,).withOnTap(onTap: () {
                      String maskedName = _maskName(infoMode.realName);
                      String maskedCard = infoMode.bankList.isNotEmpty
                          ? infoMode.bankList.first.bankCard.maskBankCardNumber()
                          : '';
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '我的收款信息',
                        'bodyWidget': _buildShareReceiverBody(maskedName, maskedCard),
                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    BaseText(
                      text: '${infoMode.bankList.length}张',
                      color: Color(0xff878787),
                      fontSize: 14.sp,
                    ),
                    Image(
                      image: !showItem?'ic_m_t_more'.png3x:'ic_m_t_less'.png3x,
                      width: 25.w,
                      height: 25.w,
                    ),
                  ],
                ).withOnTap(onTap: (){
                  showItem = !showItem;
                  setState(() {});
                })
              ],
            ),

            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                MemberInfoBankList bankModel = infoMode.bankList[index];
                return SizedBox(
                  height: 64.w,
                  child: Row(
                    children: [
                      SizedBox(width: 30.w),
                      Image(image: 'ic_jsyh'.png3x,width: 35.w,height: 35.w,),
                      SizedBox(width: 6.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BaseText(text: "中国建设银行",color: Color(0xff333333),fontSize: 16,),
                          BaseText(text: bankModel.bankCard.maskBankCardNumber(),color: Color(0xff333333),fontSize: 13,),
                        ],
                      )
                    ],
                  ),
                ).withOnTap(onTap: (){
                  // Get.toNamed(Routes.transferPagePage);
                });
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 1.w,
                  width: 311.w,
                  color: const Color(0xffE7E9EB),
                );
              },
              itemCount: showItem?infoMode.bankList.length:0,
            )
          ],
        ),
      );
    },id: 'updateBanList',);
  }
}

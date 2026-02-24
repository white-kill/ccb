import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:ccb/config/balance_config/balance_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/rotate_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/balance_config/balance_logic.dart';
import '../../../../routes/app_pages.dart';

class HomeAccountWidget extends StatefulWidget {
  const HomeAccountWidget({super.key});

  @override
  State<HomeAccountWidget> createState() => _HomeAccountWidgetState();
}

class _HomeAccountWidgetState extends State<HomeAccountWidget> {


  String nowTime = '--';
  @override
  void initState() {
    super.initState();
    nowTime = DateUtil.formatDate(DateTime.now(), format:'MM-dd HH:mm:ss');
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.w, left: 12.w, right: 12.w),
      child: _containerBg(
        width: 350.w,
        height: 135.w,
        imagePath: 'bg_home_account',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.w, bottom: 12.w),
              child: BaseText(
                text: "账户",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: 'ic_jsyh'.png3x,
                      width: 18.w,
                      height: 18.w,
                    ),
                    SizedBox(width: 4.w),

                    GetBuilder(builder: (BalanceLogic c) {
                      String card = '';
                      if(c.memberInfo.bankList.isNotEmpty){
                        card = c.memberInfo.bankList.first.bankCard.getLastFourByList();
                      }
                      return BaseText(
                        text: "账户(尾号$card)余额",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff272727),
                        ),
                      );
                    },id: 'updateCard',),
                    SizedBox(width: 4.w),
                    BalanceEyeWidget(
                      openEye: 'ic_home_eye_open',
                      closeEye: 'ic_home_eye_close',
                      width: 18.w,
                      height: 10.w,
                    )
                  ],
                ),

                Row(
                  children: [
                    BaseText(
                      text: nowTime,
                      fontSize: 12.w,
                      color: const Color(0xff272727),
                    ),
                    SizedBox(width: 6.w,),
                    RotatingWidget(
                      image: 'ic_home_ref'.png3x,
                      disCallBack: (){
                        nowTime = DateUtil.formatDate(DateTime.now(), format:'MM-dd HH:mm:ss');
                        setState(() {});
                      },
                    ),
                  ],
                )
              ],
            ).withContainer(
              padding: EdgeInsets.only(left: 22.w, right: 20.w),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                BalanceWidget(
                  length: 6,
                    size: 9,
                    child: GetBuilder(builder: (BalanceLogic c){
                      return  RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '¥',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            TextSpan(
                                text: c.balance(),
                                style: TextStyle(
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                      );
                    },id: 'updateBalance',),
                ),

                Container(
                  height: 20.w,
                  width: 70.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.w),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff3982F6),
                            Color(0xff2A54F2),
                          ])),
                  child: BaseText(
                    text: '查看详情',
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ).withContainer(
                  height: 45.w,
                  alignment: Alignment.center,
                ).withOnTap(onTap: (){
                  Get.toNamed(Routes.accountPreview);
                })
              ],
            ).withContainer(
              padding: EdgeInsets.only(left: 24.w, right: 20.w, top: 15.w),
              width: 350.w,
            )
          ],
        ),
      ),
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

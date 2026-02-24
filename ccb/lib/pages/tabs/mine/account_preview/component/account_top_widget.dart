import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/tab_indicator.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_preview_logic.dart';
import 'account_preview_tab1.dart';
import 'account_preview_tab2.dart';

class AccountTopWidget extends StatefulWidget {
  const AccountTopWidget({super.key});

  @override
  State<AccountTopWidget> createState() => _AccountTopWidgetState();
}

class _AccountTopWidgetState extends State<AccountTopWidget> {

  final AccountPreviewLogic logic = Get.put(AccountPreviewLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          // height: 90.w + ScreenUtil().statusBarHeight,
          // width: 1.sw,
          height: 1068/3240 * 1.sw,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 4.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'bg_account_preview_top1'.png3x,
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              orderTabBarBottom(),
              // 根据当前 tab 显示不同的按钮
              GetBuilder<AccountPreviewLogic>(
                builder: (c) {
                  final currentIndex = c.state.tabController.index;
                  
                  // 财富全景 (index=0) 显示小眼睛
                  if (currentIndex == 0) {
                    return GetBuilder<BalanceLogic>(
                      builder: (balanceLogic) {
                        return GestureDetector(
                          onTap: () {
                            balanceLogic.showBalance(show: !balanceLogic.showValue.value);
                          },
                          child: Container(
                            height: 40.w,
                            width: 60.w,
                            margin: EdgeInsets.only(right: 20.w),
                            alignment: Alignment.centerRight,
                            color: Colors.transparent,
                            child: Image(
                              image: balanceLogic.showValue.value
                                  ? 'ic_total_open'.png3x
                                  : 'ic_total_close'.png3x,
                              width: 18.w,
                              height: 18.w,
                            ),
                          ),
                        );
                      },
                      id: 'updateEyeBalance',
                    );
                  }
                  
                  // 银行卡 (index=1) 显示管理按钮
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.accountManager);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: Text("管理", style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'PingFangSC',
                          color: Colors.white
                      ),),
                    ),
                  );
                },
                id: 'updateTopButton',
              )
            ],
          ),
        ),

        SizedBox(
          height: 1.sh - ScreenUtil().statusBarHeight - 90.w,
          width: 1.sw,
          child: tabContent(),
        ),

      ],
    );
  }

  Widget orderTabBarBottom() {
    return TabBar(
      controller: logic.state.tabController,
      labelColor: Colors.white,
      unselectedLabelColor: const Color(0xff839CE0),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      indicator: TabIndicator(color:Colors.white,indHeight: 4.h),
      tabs: logic.state.tabNameList.map((name) {
        return BaseText(text: name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),);
      }).toList(),
    ).withContainer(
      color: Colors.transparent,
      height: 40.h,
    );
  }

  ///* tabBar内容******/
  Widget tabContent() {
    return TabBarView(
      controller: logic.state.tabController,
      children: const [
        AccountPreviewTab1(),
        AccountPreviewTab2(),
      ],
    );
  }

}

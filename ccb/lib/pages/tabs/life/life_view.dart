import 'package:ccb/config/app_config.dart';
import 'package:ccb/pages/tabs/life/life_beauty.dart';
import 'package:ccb/pages/tabs/life/life_items.dart';
import 'package:ccb/pages/tabs/life/life_now_list.dart';
import 'package:ccb/pages/tabs/life/life_order_kuaidi.dart';
import 'package:ccb/pages/tabs/life/life_order_pay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../config/balance_config/balance_logic.dart';
import 'life_logic.dart';
import 'life_state.dart';

class LifePage extends BaseStateless {
  LifePage({super.key});

  final LifeLogic logic = Get.put(LifeLogic());
  final LifeState state = Get.find<LifeLogic>().state;

  @override
  bool get isChangeNav => true;

  // @override
  // Widget? get titleWidget => PlaceholderSearchWidget(
  //       width: 204,
  //       contentList: const ['抖音红包'],
  //       bgColor: const Color(0xffEAF2FD).withOpacity(0.8),
  //     );

  @override
  Widget? get titleWidget =>  Row(
    children: [
      Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 12.w,right: 4.w)),
          Image(
            image: 'card_position'.png3x,
            width: 12.w,
            height: 16.h,
          ),
          Padding(padding: EdgeInsets.only(right: 2.w)),
          GetBuilder(builder: (BalanceLogic c) {
            return Text(
              AppConfig.config.balanceLogic.memberInfo.city,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            );
          },id: 'updateUI',),
        ],
      ),

      SizedBox(width: 6.w,),
      const Expanded(
        child: PlaceholderSearchWidget(
          contentList: ['抖音红包', '养老金火热', '建行出行享优惠'],
        ),
      ),
      SizedBox(width: 6.w,),
    ],
  );

  @override
  double? get lefItemWidth => 0.w;

  @override
  List<Widget>? get rightAction => [
        NavActionWidget(
          left: 15.w,
          right: 20.w,
          title: '客服',
          image: 'ic_home_customer',
        ),
        NavActionWidget(
          right: 12.w,
          title: '订单',
          image: 'life_order_black',
        )
      ];

  @override
  Widget? get leftItem => Container();

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        Container(
          color: Colors.yellow,
          height: 307.5.w - 44.w + ScreenUtil().statusBarHeight,
          width: 1.sw,
          child: Image(image: 'life_bg'.png3x, fit: BoxFit.fill),
        ),
        Container(
          //margin: EdgeInsets.only(top: 0.w),
          height: 128,
          color: Colors.transparent,
          child: Image(image: ('life_items').png3x),
        ),
        Padding(padding: EdgeInsets.only(top: 12.w)),
        LifePayWidget(),
        Padding(padding: EdgeInsets.only(top: 12.w)),
        LifeKuaidiWidget(),
        Padding(padding: EdgeInsets.only(top: 12.w)),
        LifeNowListWidget(),
        Padding(padding: EdgeInsets.only(top: 12.w)),
        LifeBeautyWidget()
      ],
    );
  }
}

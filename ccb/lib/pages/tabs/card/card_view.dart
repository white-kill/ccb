import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/pages/tabs/card/card_buy.dart';
import 'package:ccb/pages/tabs/card/card_create.dart';
import 'package:ccb/pages/tabs/card/card_fist_share.dart';
import 'package:ccb/pages/tabs/card/card_gift.dart';
import 'package:ccb/pages/tabs/card/card_logined/card_logined_view.dart';
import 'package:ccb/pages/tabs/card/card_need_login.dart';
import 'package:ccb/pages/tabs/card/card_point.dart';
import 'package:ccb/pages/tabs/card/card_special.dart';
import 'package:ccb/pages/tabs/card/credit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../config/app_config.dart';
import 'card_logic.dart';
import 'card_logined1.dart';
import 'card_state.dart';

class CardPage extends BaseStateless {
  CardPage({super.key}) : super();

  final CardLogic logic = Get.put(CardLogic());
  final CardState state = Get.find<CardLogic>().state;

  @override
  bool get isChangeNav => true;

  // @override
  // Widget? get titleWidget => const PlaceholderSearchWidget(
  //       contentList: ['财富会员', '养老金火热', '建行出行享优惠'],
  //       width: 245,
  //     );

  @override
  List<Widget>? get rightAction => [
        NavActionWidget(
          left: 8.w,
          title: '客服',
          image: 'ic_home_customer',
        ),
      ];

  @override
  Widget? get leftItem => Container();

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
                  // fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            );
          },id: 'updateUI',),
        ],
      ),

      SizedBox(width: 6.w,),
      Expanded(
        child: const PlaceholderSearchWidget(
          contentList: ['财富会员', '养老金火热', '建行出行享优惠'],
        ),
      ),
      SizedBox(width: 6.w,),
    ],
  );

  @override
  double? get lefItemWidth => 0.w;

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xffF6FCFF),
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
           CrediBannerWidget(),
           //CardNeedLoginWidget(),
          Card_loginedPage1(),
          FirstShareWidget(),
          Padding(padding: EdgeInsets.only(top: 10.w)),
          CardBuyWidget(),
          Padding(padding: EdgeInsets.only(top: 10.w)),
          CardPointWidget(),
          Padding(padding: EdgeInsets.only(top: 10.w)),
          CardCreateWidget(),
          Padding(padding: EdgeInsets.only(top: 10.w)),
          CardGiftWidget(),
          Padding(padding: EdgeInsets.only(top: 10.w)),
          CardSpecialWidget(),
        ],
      ),
    );
  }
}

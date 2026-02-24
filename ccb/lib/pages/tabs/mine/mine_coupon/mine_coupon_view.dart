import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'mine_coupon_logic.dart';
import 'mine_coupon_state.dart';

class MineCouponPage extends BaseStateless {
  MineCouponPage({Key? key}) : super(key: key,title: '我的优惠券');

  final MineCouponLogic logic = Get.put(MineCouponLogic());
  final MineCouponState state = Get.find<MineCouponLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return Container();
  }
}

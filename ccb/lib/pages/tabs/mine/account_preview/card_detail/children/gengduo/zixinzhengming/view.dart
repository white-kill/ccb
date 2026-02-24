import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class ZiXinZhengMingPage extends BaseStateless {
  ZiXinZhengMingPage({Key? key}) : super(key: key);

  final ZiXinZhengMingLogic logic = Get.put(ZiXinZhengMingLogic());
  final ZiXinZhengMingState state = Get.find<ZiXinZhengMingLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem => Align(
    alignment: Alignment.centerLeft,
    child: Container(
      width: 50,
      height: 40,
    ).withOnTap(onTap: () {
      Get.back();
    })
  );

  @override
  List<Widget>? get rightAction => [
    Container(
      width: 50,
      height: 50,
    ).withOnTap(onTap: () {
      Get.back();
    })
  ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
            Image(
              image: AssetImage('assets/new_images/home/account/detail/children/zxzm.png'),
              fit: BoxFit.fitWidth,
              width: screenWidth,
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class ZxzmPage extends BaseStateless {
  ZxzmPage({Key? key}) : super(key: key, title: "资信证明");

  final ZxzmLogic logic = Get.put(ZxzmLogic());
  final ZxzmState state = Get
      .find<ZxzmLogic>()
      .state;

  @override
  bool get isChangeNav => false;

  @override
  // TODO: implement navColor
  Color? get navColor => Colors.white;

  @override
  // TODO: implement titleColor
  Color? get titleColor => Colors.black;

  @override
  // TODO: implement navTitleColor
  Color? get navTitleColor => Colors.black;

  var tabIndex = 1.obs;


  @override
  Widget initBody(BuildContext context) {
    return GetBuilder<ZxzmLogic>(builder: (logic) {
      return Container(
        child:
        Image(image: 'zxzm'.png, fit: BoxFit.fitWidth,),
      );
    });
  }
}

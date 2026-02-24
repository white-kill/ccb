import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'gongjijin_logic.dart';
import 'gongjijin_state.dart';

class GongjijinPage extends BaseStateless {
  GongjijinPage({Key? key}) : super(key: key);
  final GongjijinLogic logic = Get.put(GongjijinLogic());
  final GongjijinState state = Get.find<GongjijinLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem => SizedBox();

  @override
  Color? get navColor => Colors.white.withOpacity(0.0);

  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              child: Image(image: ('bg_zfgjj').png3x),
            )
          ],
        ).withOnTap(onTap: () {
          Get.back();
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'kjzf_logic.dart';
import 'kjzf_state.dart';

class KjzfPage extends BaseStateless {
  KjzfPage({Key? key}) : super(key: key);

  final KjzfLogic logic = Get.put(KjzfLogic());
  final KjzfState state = Get.find<KjzfLogic>().state;

  @override
  // TODO: implement titleWidget
  Widget? get titleWidget =>
      BaseText(text: '快捷支付管理', fontSize: 18.sp, color: Colors.black);

  @override
  Widget initBody(BuildContext context) {
    return ListView(children: [
      Padding(padding: EdgeInsets.only(top: 20.w)),
      Container(
          child: Row(
        children: [
          Padding(padding: EdgeInsets.only(right: 20.w)),
          Text(
            '快捷支付管理 ',
          ),
          Image(
            image: 'bg_down_ar'.png3x,
            width: 20.w,
            height: 20.w,
          )
        ],
      )),
      Padding(padding: EdgeInsets.only(top: 15.w)),
      Image(image: ('bg_kjzf_m').png3x),
    ]);
  }
}

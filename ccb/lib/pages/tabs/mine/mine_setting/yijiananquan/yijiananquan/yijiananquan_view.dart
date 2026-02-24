import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'yijiananquan_logic.dart';
import 'yijiananquan_state.dart';

class YijiananquanPage extends BaseStateless {
  YijiananquanPage({Key? key}) : super(key: key);

  final YijiananquanLogic logic = Get.put(YijiananquanLogic());
  final YijiananquanState state = Get.find<YijiananquanLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  double? get lefItemWidth => 62.w;

  @override
  Widget? get titleWidget => Text(
        "一键安全检测",
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      );
  @override
  List<Widget>? get rightAction => [];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().statusBarHeight + kToolbarHeight)),
        Container(
          color: Colors.yellow,
          height: 725.w,
          width: 1.sw,
          child: Image(image: 'bg_yjaqjc'.png3x, fit: BoxFit.fill),
        )
      ],
    );
  }
}

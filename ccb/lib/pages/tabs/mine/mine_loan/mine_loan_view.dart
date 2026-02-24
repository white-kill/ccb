import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'mine_loan_logic.dart';
import 'mine_loan_state.dart';

class MineLoanPage extends BaseStateless {
  MineLoanPage({Key? key}) : super(key: key,title: '首页');

  final MineLoanLogic logic = Get.put(MineLoanLogic());
  final MineLoanState state = Get.find<MineLoanLogic>().state;


  @override
  Widget initBody(BuildContext context) {

    return Column(
      children: [
        Expanded(child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image(
              image: 'bg_dk'.png3x,
              fit: BoxFit.fitWidth,
              width: 1.sw,
            ),
          ],
        )),

        Image(
          image: 'bg_dk_bottom'.png3x,
          fit: BoxFit.fitWidth,
          width: 1.sw,
        )
      ],
    );
  }
}

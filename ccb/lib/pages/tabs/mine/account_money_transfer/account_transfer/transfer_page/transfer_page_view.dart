import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'transfer_page_logic.dart';
import 'transfer_page_state.dart';

class TransferPagePage extends BaseStateless {
  TransferPagePage({Key? key}) : super(key: key,title: '转账');

  final TransferPageLogic logic = Get.put(TransferPageLogic());
  final TransferPageState state = Get.find<TransferPageLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Widget initBody(BuildContext context) {

    return GetBuilder(builder: (TransferPageLogic c){
      return Container(
        padding: EdgeInsets.only(top: 60.w),
        child: Column(
          children: [
            SquareProgressIndicator(
              value: logic.secondsRemaining/10,
              width: 130.w,
              height: 130.w,
              borderRadius: 65.w,
              startPosition: StartPosition.rightCenter,
              strokeCap: StrokeCap.square,
              clockwise: true,
              color: const Color(0xff3C6DD3),
              emptyStrokeColor:const Color(0xffd2d2d2),
              strokeWidth: 2,
              emptyStrokeWidth: 2,
              strokeAlign: SquareStrokeAlign.outside,
              child: BaseText(text: "${(10-logic.secondsRemaining.floor())}",fontSize: 50,),
            ),
            SizedBox(height: 12.w,),
            BaseText(text: '正等待收款银行返回结果...',fontSize: 12.sp,),
            SizedBox(height: 4.w,),
            BaseText(text: '结果返回前，请不要重复转账',fontSize: 12.sp,color:const Color(0xff3C6DD3),),
          ],
        ),
      );
    },id: 'updateUI',);
  }
}

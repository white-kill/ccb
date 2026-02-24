import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'zhgk_logic.dart';
import 'zhgk_state.dart';

class ZhgkPage extends BaseStateless {
  ZhgkPage({Key? key}) : super(key: key);

  final ZhgkLogic logic = Get.put(ZhgkLogic());
  final ZhgkState state = Get.find<ZhgkLogic>().state;

  @override
  Widget? get titleWidget => const Text(
        '账号管控应急恢复',
        style: TextStyle(fontSize: 18, color: Colors.black),
      );
  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 1.sw - 32.w,
                color: Colors.white,
                height: 150.w,
                child: Text(
                  '尊敬的客户，即将为您恢复账户的存款，取款，转账，消费等账户性交易，恢复使用时间为业务办理完成后至次日24点，为避免影响您办理业务，请尽快持本人有效身份证到建行手机银行、个人网银或全国任一建行网点办理信息更新',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 320.w)),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  '确认',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ));
  }
}

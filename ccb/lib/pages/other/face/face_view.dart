import 'package:ccb/pages/index/index_logic.dart';
import 'package:ccb/utils/face_util.dart';
import 'package:ccb/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'face_logic.dart';
import 'face_state.dart';

class FacePage extends BaseStateless {

  FacePage({super.key});

  final FaceLogic logic = Get.put(FaceLogic());
  final FaceState state = Get.find<FaceLogic>().state;


  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("点击认证").withOnTap(onTap: (){
        FaceUtil.localAuth().then((v){
          Get.back(result: '1');
        });
      }),
    );
  }
}

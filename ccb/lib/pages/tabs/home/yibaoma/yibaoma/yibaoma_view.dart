import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'yibaoma_logic.dart';
import 'yibaoma_state.dart';

class YibaomaPage extends BaseStateless {
  YibaomaPage({Key? key}) : super(key: key);

  final YibaomaLogic logic = Get.put(YibaomaLogic());
  final YibaomaState state = Get.find<YibaomaLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: Image(
            image: ('bg_yibaoma').png3x,
            fit: BoxFit.fill) // Replace with your image asset path,
        );
  }
}

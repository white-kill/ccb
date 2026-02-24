import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MoLiNaiBaiPage extends StatelessWidget {
  MoLiNaiBaiPage({Key? key}) : super(key: key);

  final MoLiNaiBaiLogic logic = Get.put(MoLiNaiBaiLogic());
  final MoLiNaiBaiState state = Get.find<MoLiNaiBaiLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

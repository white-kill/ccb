import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SzrmbPage extends StatelessWidget {
  SzrmbPage({Key? key}) : super(key: key);

  final SzrmbLogic logic = Get.put(SzrmbLogic());
  final SzrmbState state = Get.find<SzrmbLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      alignment: Alignment.center,
      child: Image.asset('assets/new_images/home/children/szrmb.png', width: screenWidth/2,),
    );
  }
}

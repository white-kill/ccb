import 'package:get/get.dart';

import 'mine_pz_state.dart';

class MinePzLogic extends GetxController {
  final MinePzState state = MinePzState();

  String image = '';
  @override
  void onInit() {
    super.onInit();
    image = Get.arguments?['image']??'';
  }
}

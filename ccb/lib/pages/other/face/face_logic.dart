import 'package:get/get.dart';

import '../../../utils/face_util.dart';
import 'face_state.dart';

class FaceLogic extends GetxController {
  final FaceState state = FaceState();

  @override
  void onInit() {
    super.onInit();
    FaceUtil.localAuth().then((v){
      Get.back(result: '1');
    });
  }
}

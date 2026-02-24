import 'package:get/get.dart';
import 'state.dart';

class GuiJinShuMainLogic extends GetxController {
  final GuiJinShuMainState state = GuiJinShuMainState();

  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
} 
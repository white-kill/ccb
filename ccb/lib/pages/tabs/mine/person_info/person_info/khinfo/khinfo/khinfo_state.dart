import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'Kh_data.dart';

class KhinfoState {
  final RxList<item> items = <item>[].obs;

  KhData khData = KhData();
}

class item {
  String? title;
  String? centerContent;
  bool showrightImage;
  bool darkColor;
  bool? showTextField = false;
  String? data;

  item({
    this.title,
    this.centerContent,
    required this.showrightImage,
    required this.darkColor,
    this.showTextField,
    this.data,
  });
}

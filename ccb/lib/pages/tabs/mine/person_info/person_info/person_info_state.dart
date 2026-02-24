import 'package:get/get.dart';

class Person_infoState {
  final RxList<item> items = <item>[].obs;
  final RxList<String> bomttomSheets = <String>[].obs;
}
class item {
  String? title;
  String? subtitle;
  String? rightContent;
  String? rightImage;
  String? routeName;
  item(
      {this.title,
      this.subtitle,
      this.rightImage,
      this.routeName,
      this.rightContent});
}

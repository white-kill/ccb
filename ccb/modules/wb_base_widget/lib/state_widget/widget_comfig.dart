import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'app_bar_widget.dart';

typedef BodyWidgetBuilder = Widget Function(BuildContext context);

mixin StateWidgetConfig {

  Function? get backCallBack => null;

  Widget? get titleWidget => null;

  Widget? get leftItem => null;

  double? get lefItemWidth => null;

  List<Widget>? get rightAction => null;

  bool get enablePullUp => true;

  bool get enablePullDown => true;

  Color? get navColor => null;

  Color? get titleColor => null;

  Color? get navTitleColor => null;

  Color? get leadingColor => null;

  Color? get background => null;

  Color? get backColor => Colors.black;

  bool get isShowAppBar => true;

  bool get isWantKeepAlive => false;

  bool get isChangeNav => false;

  bool get bottomInset => true;

  bool get noBackGround1 => true;

  Widget? get bottomNav => null;

  Function(bool change)? get onNotificationNavChange => null;

  AppBarController? get appBarController => null;

  void onRefresh() {}

  void onLoading() {}

  ///界面进入
  void initDefaultState() {}

  ///界面销毁
  void initDefaultDispose() {}

  bool get extendBodyBehindAppBar => false;

  RefreshController? get refreshController => null;

  bool get onWillPop => true;

}
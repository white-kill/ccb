import 'package:ccb/pages/tabs/new_life/view.dart';
import 'package:flutter/cupertino.dart';
import '../tabs/new_card/card_page/card_page/view.dart';
import '../tabs/home/home_view.dart';
// import '../tabs/life/life_view.dart'; // No longer needed
import '../tabs/mine/mine_view.dart';
import '../tabs/wealth/wealth_view.dart';

class IndexState {


  /// 页面放到数组中
  /// EssencePageWidget
  /// InheritedWidgetTestContainer
  late List<Widget> pageList;


  ///appTabList
  late List<Map> appBarList;


  /// item
  late List<Widget>  item;


  IndexState() {
    ///Initialize variables

    pageList = [
      HomePage(),
      CardPagePage(),

      WealthPage(),
      NewLifePage(),
      MinePage(),
    ];


    ///#2B55F2
    ///#4CAED7
    ///#C98A34
    ///#E98C3E
    ///#7892F3
    appBarList = const [
      {"title":"首页", "icon":"tabbar",'index':0,'selectColor':0xff3B56B0},
      {"title":"信用卡", "icon":"tabbar",'index':1,'selectColor':0xff50B6CA},
      {"title":"财富", "icon":"tabbar",'index':2,'selectColor':0xffBC914C},
      {"title":"生活", "icon":"tabbar",'index':3,'selectColor':0xffEA964E},
      {"title":"我的", "icon":"tabbar",'index':4,'selectColor':0xff6474A5},
    ];


  }
}

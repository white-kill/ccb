import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:ccb/utils/event_bus_util.dart';

import 'ckcp/view.dart';
import 'wdck/view.dart';
import 'wdck/logic.dart';

class CkcpPage extends StatefulWidget {
  const CkcpPage({Key? key}) : super(key: key);

  @override
  State<CkcpPage> createState() => _CkcpPageState();
}

class _CkcpPageState extends State<CkcpPage> {
  final RxInt _selectedIndex = 0.obs;
  StreamSubscription? _eventSubscription;

  @override
  void initState() {
    super.initState();
    // 监听切换tab事件
    _eventSubscription = EventBusUtil.getInstance().on<SwitchTabEvent>().listen((event) {
      if (event.tabName == 'ckcp') {
        _selectedIndex.value = 0;
      }
    });
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: screenHeight,
              padding: EdgeInsets.only(bottom: 40),
              child: Obx(() => _selectedIndex.value == 0 ? CkcpView() : WdckView())),
          // 底部tab导航
          Positioned(
            bottom: 0,
            left: 0,
             right: 0,
            child: Obx(() => Container(
              height: screenWidth/375 * 64,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    _selectedIndex.value == 0
                        ? 'assets/new_images/cai_fu/children/ckcp/ckcp_bottom_bg.png'
                        : 'assets/new_images/cai_fu/children/ckcp/wdck_bottom_bg.png'
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectedIndex.value = 0,
                      child: Container(
                        height: 60.w,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Image.asset(
                                _selectedIndex.value == 0
                                    ? 'assets/new_images/cai_fu/children/ckcp/ckcp_icon_sel.png'
                                    : 'assets/new_images/cai_fu/children/ckcp/ckcp_icon_normal.png',
                                height: 24.w,
                              ),
                            ),
                            Text("存款产品", style: TextStyle(
                                fontSize: 12
                            ),)                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectedIndex.value = 1,
                      child: Container(
                        height: 60.w,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Image.asset(
                                _selectedIndex.value == 1
                                    ? 'assets/new_images/cai_fu/children/ckcp/wdck_sel.png'
                                    : 'assets/new_images/cai_fu/children/ckcp/wdck_normal.png',
                                height: 24.w,
                              ),
                            ),
                            Text("我的存款", style: TextStyle(
                              fontSize: 12
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
} 
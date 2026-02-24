import 'package:ccb/pages/tabs/home/component/ad_banner_widget.dart';
import 'package:ccb/pages/tabs/home/component/function_banner_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_account_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_life_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_notice_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_yanglao_widget.dart';
import 'package:ccb/pages/tabs/home/component/selective_widget.dart';
import 'package:ccb/pages/tabs/home/component/top_banner_widget.dart';
import 'package:ccb/pages/tabs/home/two_level/two_level_view.dart';
import 'package:ccb/utils/common_right_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/app_bar_widget.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import '../../index/index_logic.dart';
import 'component/home_bottom_widget.dart';
import 'component/home_hose_widget.dart';
import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends BaseStateless {
  HomePage({super.key});

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get titleWidget => const PlaceholderSearchWidget(
    rightIcon: SizedBox(),
        contentList: ['财富会员', '养老金火热', '建行出行享优惠'],
      );

  // @override
  // double? get lefItemWidth => 0;

  @override
  Widget? get leftItem => Obx(() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.w,),
          Image(
            image: 'ic_home_version'.png3x,
            color:  logic.navActionColor.value,
            width: 15.w,
          ),
          SizedBox(height: 5.w,),
          Text("版本", style: TextStyle(
            fontSize: 11.w,
             height: 1.0,
             color: logic.navActionColor.value,
          ),),
        ],
      ).withOnTap(onTap: () {
        Get.toNamed(Routes.fixedNavPage, arguments: {
          'title': '版本切换',
          'image': 'version_view',
          'rightWidget': Row(
            children: CommonRightButton.build([])),
        });
      }));

  @override
  List<Widget>? get rightAction => [
        Obx(() => NavActionWidget(
              left: 16.w,
              color: logic.navActionColor.value,
              title: '客服',
              image: 'ic_home_customer',
            )),
        Obx(() => NavActionWidget(
              color: logic.navActionColor.value,
              title: '消息',
              image: 'ic_home_message',
              routesName: Routes.mineMessagePage,
            )),
    Obx(() => NavActionWidget(
      color: logic.navActionColor.value,
      title: '扫一扫',
      image: 'ic_home_scan',
      routesName: Routes.mineMessagePage,
    )),
      ];

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  AppBarController? get appBarController => state.appBarController;

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return RefreshConfiguration.copyAncestor(
        context: context,
        enableScrollWhenTwoLevel: true,
        maxOverScrollExtent: 120,
        child: LayoutBuilder(builder: (_, __) {
          return SmartRefresher(
            header: TwoLevelHeader(
              textStyle: TextStyle(color: Colors.transparent),
              idleIcon: SizedBox.shrink(),
              displayAlignment: TwoLevelDisplayAlignment.fromBottom,
              decoration: BoxDecoration(
                color: Color(0xFF378BFF),
                image: DecorationImage(
                    image: 'home_two_transation'.png,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter),
              ),
              twoLevelWidget: TwoLevelPage(),
            ),
            controller: state.refreshController,
            enableTwoLevel: true,
            enablePullDown: false,
            enablePullUp: false,
            onTwoLevel: (bool isOpen) {
              final IndexLogic indexLogic = Get.put(IndexLogic());
              indexLogic.showTabBar.value = !isOpen;
              Future.delayed(
                  Duration(milliseconds: indexLogic.showTabBar.value ? 600 : 0),
                  () {
                state.appBarController
                    .changeTabTitle(indexLogic.showTabBar.value);
              });
            },
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                TopBannerWidget(),
                // FunctionBannerWidget(),
                HomeNoticeWidget(),
                AdBannerWidget(),
                SelectiveWidget(),
                HomeAccountWidget(),
                HomeYangLaoWidget(),
                HomeHoseWidget(),
                HomeLifeWidget(),
                HomeBottomWidget(),
              ],
            ),
          );
        }),
      );
    });
  }

  // @override
  // Widget initBody(BuildContext context) {
  //   return GetBuilder(
  //     builder: (HomeLogic c) {
  //       return RefreshConfiguration.copyAncestor(
  //         context: context,
  //         enableScrollWhenTwoLevel: true,
  //         maxOverScrollExtent: 120,
  //         child: LayoutBuilder(
  //           builder: (_, __) {
  //             return SmartRefresher(
  //               header: TwoLevelHeader(
  //                 textStyle: TextStyle(color: Colors.transparent),
  //                 idleIcon: SizedBox.shrink(),
  //                 displayAlignment: TwoLevelDisplayAlignment.fromBottom,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: 'two_level'.png3x,
  //                       fit: BoxFit.cover,
  //                       alignment: Alignment.topCenter),
  //                 ),
  //                 twoLevelWidget: TwoLevelPage(),
  //               ),
  //               controller: state.refreshController,
  //               enableTwoLevel: true,
  //               enablePullDown: false,
  //               enablePullUp: false,
  //               onTwoLevel: (bool isOpen) {
  //                 // final IndexLogic logic = Get.put(IndexLogic());
  //                 // logic.showTabBar = !isOpen;
  //                 // Future.delayed(
  //                 //     Duration(milliseconds: logic.showTabBar ? 600 : 0), () {
  //                 //   state.appBarController.changeTabTitle(logic.showTabBar);
  //                 // });
  //                 // logic.update(['updateTabBar']);
  //               },
  //               child: ListView(
  //                 padding: EdgeInsets.zero,
  //                 children: const [
  //                   TopBannerWidget(),
  //                   FunctionBannerWidget(),
  //                   HomeNoticeWidget(),
  //                   AdBannerWidget(),
  //                   SelectiveWidget(),
  //                   HomeAccountWidget(),
  //                   HomeYangLaoWidget(),
  //                   HomeHoseWidget(),
  //                   HomeLifeWidget(),
  //                   HomeBottomWidget(),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //     id: 'updateUI',
  //   );
  // }
}

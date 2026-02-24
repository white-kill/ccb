import 'package:ccb/pages/subpages/search/search_items.dart';
import 'package:ccb/pages/subpages/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../config/app_config.dart';
import 'search_logic.dart';

class SearchPage extends BaseStateless {
  SearchPage({super.key});

  final Search_Logic logic = Get.put(Search_Logic());
  final Search_State state = Get.find<Search_Logic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get titleWidget => Row(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 12.w)),
              Image(
                image: 'card_position'.png3x,
                width: 12.w,
                height: 16.h,
              ),
              Padding(padding: EdgeInsets.only(right: 4.w)),
              Text(
                AppConfig.config.balanceLogic.memberInfo.city,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),

          Expanded(
              child: const TextFieldWidget(
            hintText: '上海资产提升月月赢',
          ).withContainer(
            height: 34.w,
            margin: EdgeInsets.only(left: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.w)),
            ),
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
          )),

        ],
      );

  @override
  double? get lefItemWidth => 35.w;

  @override
  bool get noBackGround1 => false;


  @override
  List<Widget>? get rightAction => [
        Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15.w)),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 50.w,
              height: 20.w,
              child: Text(
                '搜索',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff3B79E4),
                    fontWeight: FontWeight.bold),
              ).withOnTap(onTap: () {}),
            ),
          ],
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color.fromARGB(132, 129, 178, 238),
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SearchItemsWidget(),
              Image(image: ('bg_search_main').png3x)
            ],
          ),
        )
      ]),
    );
  }
}

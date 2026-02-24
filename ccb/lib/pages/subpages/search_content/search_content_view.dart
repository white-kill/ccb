import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../config/app_config.dart';
import '../../../routes/app_pages.dart';
import 'search_content_logic.dart';
import 'search_content_state.dart';

class SearchContentPage extends BaseStateless {
  SearchContentPage({Key? key}) : super(key: key);

  final SearchContentLogic logic = Get.put(SearchContentLogic());
  final SearchContentState state = Get.find<SearchContentLogic>().state;

  @override
  bool get isChangeNav => true;

  // @override
  // Widget? get titleWidget => PlaceholderSearchWidget(
  //       bgColor: Colors.white,
  //       contentList: [Get.arguments?['name'] ?? '搜索'],
  //       textColor: Colors.black,
  //     );

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
            child: Container(
              height: 34.w,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.w)),
              ),
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: BaseText(text: Get.arguments?['name'] ?? '搜索'),
            ),
          ),
        ],
      );

  @override
  double? get lefItemWidth => 35.w;

  Widget _spanText(String content, keyword, {bool isName = false}) {
    print(content);
    print(keyword);
    return Text.rich(
      TextSpan(
        children: _highlightKeywords(content, keyword, isName: isName),
      ),
    );
  }

  List<TextSpan> _highlightKeywords(String text, String keyword,
      {bool isName = false}) {
    List<TextSpan> spans = [];
    final pattern = RegExp(keyword);
    int lastEnd = 0;

    for (final match in pattern.allMatches(text)) {
      spans.add(TextSpan(
          text: text.substring(lastEnd, match.start),
          style: TextStyle(
            fontWeight: isName ? FontWeight.w600 : FontWeight.normal,
          )));
      spans.add(TextSpan(
        text: match.group(0),
        style: TextStyle(
          color: Colors.blue,
          fontSize: 14.sp,
          fontWeight: isName ? FontWeight.w600 : FontWeight.normal,
        ),
      ));
      lastEnd = match.end;
    }
    // 添加剩余文本
    spans.add(TextSpan(
        text: text.substring(lastEnd),
        style: TextStyle(
          fontWeight: isName ? FontWeight.w600 : FontWeight.normal,
        )));
    return spans;
  }

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
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return state.name == '电子印章'
        ? ListView(
            padding: EdgeInsets.only(top: navHeight),
            shrinkWrap: true,
            children: [
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: state.titleList.map((e) {
                  return BaseText(
                    text: e,
                    style: TextStyle(
                        fontSize: e == logic.selectName.value ? 17.sp : 15.sp,
                        fontWeight: FontWeight.bold,
                        color: e == logic.selectName.value
                            ? Colors.blue
                            : e == '活动'
                            ? Colors.grey
                            : Colors.black),
                  ).withOnTap(onTap: (){
                    print(e);
                    if( Get.arguments?['name'] == '流水打印'){
                      if(e == '精选' || e == '服务'){
                        logic.selectName.value = e;
                      }
                    }
                  });
                }).toList(),
              ).withPadding(
                  left: 20.w,
                  right: 20.w,
                  top: 5.w,
                  bottom: 6.w),),
              Container(
                margin: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: '功能',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ).withPadding(left: 12.w, top: 20.w, bottom: 12.w),
                    ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = state.dzyzList[index];
                          return Row(
                            children: [
                              Image(
                                image: (data['icon'].toString()).png3x,
                                width: 32.w,
                                height: 32.w,
                              ).withPadding(left: 20.w, right: 12.w),
                              BaseText(
                                text: data['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              )
                            ],
                          )
                              .withContainer(
                            height: 55.w,
                          )
                              .withOnTap(onTap: () {
                            logic.jumpPage(data['name']);
                          });
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            width: 1.sw,
                            height: 0.5.w,
                            color: const Color(0xffdedede),
                          );
                        },
                        itemCount: state.dzyzList.length),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 6.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                child: Image(
                  image: 'dzyz_tem'.png3x,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: ScreenUtil().bottomBarHeight,
                color: Colors.white,
              )
            ],
          )
        : ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              Obx(() => Container(
                height:logic.selectName.value == '服务'?160.w: 330.w,
                width: 1.sw,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  image: logic.selectName.value == '服务'?null:DecorationImage(
                    image: 'ic_search_top'.png3x,
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: state.titleList.map((e) {
                        return BaseText(
                          text: e,
                          style: TextStyle(
                              fontSize: e == logic.selectName.value ? 17.sp : 15.sp,
                              fontWeight: FontWeight.bold,
                              color: e == logic.selectName.value
                                  ? Colors.blue
                                  : e == '活动'
                                  ? Colors.grey
                                  : Colors.black),
                        ).withOnTap(onTap: (){
                          print(e);
                          if( Get.arguments?['name'] == '流水打印'){
                            if(e == '精选' || e == '服务'){
                              logic.selectName.value = e;
                            }
                          }
                        });
                      }).toList(),
                    ).withPadding(
                        left: 20.w,
                        right: 20.w,
                        top: 5.w,
                        bottom: 6.w),),
                   logic.selectName.value == '服务'?SizedBox.shrink():Container(
                      width: 340.w,
                      height: 100.w,
                      margin: EdgeInsets.only(bottom: 30.w),
                      alignment: Get.arguments?['name'] == '电子印章'
                          ? Alignment.center
                          : Alignment.bottomCenter,
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: Get.arguments?['name'] == '电子印章'
                          ? Container(
                        color: const Color(0xFFF7F7F7),
                        width: 170.w,
                        height: 45.w,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BaseText(
                              text: '电子印章查验',
                              color: Colors.blue,
                              fontSize: 14.sp,
                            ).withOnTap(
                                onTap: () => {logic.jumpPage('电子印章查验')})
                          ],
                        ),
                      )
                          : logic.selectName.value == '服务'?SizedBox.shrink():VerticalGridView(
                        widgetBuilder: (_, index) {
                          Map<String, dynamic> data =
                          state.nameData[state.name]![index];
                          return Container(
                            color: const Color(0xFFF7F7F7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BaseText(
                                  text: data['name'],
                                  color: data['color'],
                                  fontSize: 14.sp,
                                ),
                                data['name'] == '账户明细查询'? Container(
                                  margin: EdgeInsets.only(left: 2.w),
                                  width: 18.w,
                                  height: 18.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xfff14f4f),
                                      borderRadius: BorderRadius.all(Radius.circular(2.w))
                                  ),
                                  alignment: Alignment.center,
                                  child: BaseText(
                                    text: '荐',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        height: 1
                                    ),
                                  ),
                                ):SizedBox.shrink()
                              ],
                            ).withOnTap(
                                onTap: () =>
                                {logic.jumpPage(data['name'])}),
                          );
                        },
                        itemCount: state.nameData[state.name]!.length,
                        crossCount: 2,
                        mainHeight: 38.w,
                        spacing: 8.w,
                      ),
                    ),
                  ],
                ).withPadding(
                  top: navHeight + 4.w,
                ),
              )),
              Container(
                margin: EdgeInsets.only(left: 12.w, right: 12.w),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: '功能',
                          fontSize: 16.sp,
                        ),
                        // GestureDetector(
                        //   child: BaseText(
                        //     text: '更多',
                        //     fontSize: 12.sp,
                        //     color: const Color(0xff666666),
                        //   ),
                        //   onTap: () {
                        //     Get.toNamed(Routes.gengduo);
                        //   },
                        // )
                      ],
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              state.contentDat[state.name]![index];
                          String iconStr = data['icon'];
                          return Container(
                                  padding: EdgeInsets.all(
                                    16.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Image(
                                        image: iconStr.png3x,
                                        width: 24.w,
                                        height: 24.w,
                                      ).withPadding(right: 12.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _spanText(
                                              data['name'], data['keyword'],
                                              isName: true),
                                          data['content'] == ''
                                              ? const SizedBox.shrink()
                                              : _spanText(data['content'],
                                                  data['keyword'])
                                        ],
                                      ),
                                    ],
                                  ))
                              .withOnTap(
                                  onTap: () => {logic.jumpPage(data['name'])});
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            width: 1.sw,
                            height: 0.5.w,
                            color: const Color(0xffdedede),
                          );
                        },
                        itemCount: state.contentDat[state.name]!.length),
                  ],
                ),
              ),
              Image(image: 'ic_search_bottom'.png3x).withPadding(
                top: 10.w,
              ).withOnTap(onTap: (){
                Get.toNamed(Routes.ccbCustomerPage,);
              }),
              Image(image: 'pj'.png3x).withPadding(
                top: 10.w,
              ),
            ],
          );
  }
}

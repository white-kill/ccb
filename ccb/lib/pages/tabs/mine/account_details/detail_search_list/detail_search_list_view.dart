import 'package:ccb/pages/tabs/mine/account_details/detail_search_list/new_picker/new_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../component/account_details_item_widget.dart';
import 'detail_search_list_logic.dart';
import 'detail_search_list_state.dart';
import 'details_picker/details_piceker.dart';

class DetailSearchListPage extends BaseStateless {
  DetailSearchListPage({Key? key}) : super(key: key);

  final DetailSearchListLogic logic = Get.put(DetailSearchListLogic());
  final DetailSearchListState state = Get.find<DetailSearchListLogic>().state;



  @override
  List<Widget>? get rightAction => [
    BaseText(text: '搜索',fontSize: 15.sp,).withOnTap(onTap: () {
      Get.offNamed(Routes.detailSearchPage);
    }).withContainer(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 16.w,right: 15.w)
    ),
  ];
  @override
  Widget? get titleWidget => PlaceholderSearchWidget(
    bgColor: Colors.white,
    contentList: [Get.arguments?['keyword']??''],
    textColor: Colors.black,
    textSize: 14.sp,
    rightIcon: const SizedBox.shrink(),
    onTap: (){
      Get.offNamed(Routes.detailSearchPage);
    },
  );

  @override
  Color? get navColor => Color(0xFFF7F7F7);

  @override
  get refreshController => state.refreshController;

  // @override
  // void onRefresh() {
  //   super.onRefresh();
  //   state.reqData1.pageNum = 1;
  //   logic.getListData();
  // }

  @override
  void onLoading() {
    super.onLoading();
    state.reqData1.pageNum++;
    logic.getListData(isRef: false);
  }

  @override
  bool get enablePullDown => false;

  @override
  Widget initBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        children: [
          Container(
            height: 114.w,
            width: 355.w,
            margin: EdgeInsets.only(top: 20.w),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: 'bg_mx_top'.png3x,
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder(
                      builder: (DetailSearchListLogic c) {
                        return state.isDay
                            ? Row(
                          children: [
                            BaseText(
                              text: state.beginTime1.timeDrop1,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            BaseText(
                              text: "至",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            BaseText(
                              text: state.endTime1.timeDrop1,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Image(
                              image: "ic_mx_sx1".png3x,
                              width: 10.w,
                              height: 10.w,
                            ),
                          ],
                        )
                            : Row(
                          children: [
                            BaseText(
                              text: logic.checkCurrentMonth(state.monthTime1),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image(
                              image: "ic_mx_sx1".png3x,
                              width: 10.w,
                              height: 10.w,
                            )
                          ],
                        );
                      },
                      id: 'updateTime',
                    ).withPadding(top: 25.w, left: 20.w).withOnTap(onTap: () {
                      NewSearchPicker.showNewTime( newHeadNotifier: state.newHeaderNotifier);
                    }),

                    GetBuilder(
                      builder: (DetailSearchListLogic c) {
                        return _topTagWidget(
                            title: '时间',
                            image: 'ic_mx_sx2',
                            color:
                            state.orderSort == '2' ? Colors.blue : Colors.black)
                            .withOnTap(onTap: () {
                          state.orderSort = state.orderSort == '1' ? '2' : '1';
                          c.getListData(isRef: true);
                          c.update(['updateTime']);
                        }).withContainer(
                          width:60.w,
                          padding: EdgeInsets.only(top: 25.w),
                          alignment: Alignment.bottomRight,
                        );
                      },
                      id: 'updateTime',
                    ),

                  ],
                ),
                GetBuilder(
                  builder: (DetailSearchListLogic c) {
                    return Row(
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: "支出",
                              fontSize: 15.sp,
                              color: const Color(0xff737373),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            BaseText(
                              text: "${state.expensesTotal}",
                              fontSize: 15.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: "收入",
                              fontSize: 15.sp,
                              color: const Color(0xff737373),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            BaseText(
                              text: "${state.incomeTotal}",
                              fontSize: 15.sp,
                            )
                          ],
                        ),
                      ],
                    ).withPadding(top: 30.w, left: 20.w);
                  },
                  id: 'updateUI',
                ),
              ],
            ),
          ),
          GetBuilder(
            builder: (DetailSearchListLogic c) {
              return Expanded(
                child: state.list.isEmpty
                    ? Column(
                  children: [
                    SizedBox(
                      height: 25.w,
                    ),
                    Image(
                      image: 'ic_mx_no_data'.png3x,
                      width: 100.w,
                      height: 100.w,
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    BaseText(
                      text: '没有查询到符合条件的明细记录',
                      fontSize: 12.sp,
                      color: Color(0xff999999),
                    ),
                  ],
                )
                    : refreshWidget(
                    child: ListView.separated(
                      controller: state.controller,
                      itemBuilder: (context, index) {
                        return AccountDetailsItemWidget(
                          model: state.list[index],
                        ).withOnTap(onTap: () {
                          Get.toNamed(Routes.detailInfoPage,arguments: {
                            'id':state.list[index].id,
                            'model':state.list[index].billDetail,
                          });
                        });
                      },
                      itemCount: state.list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          color: const Color(0xffE7E9EB),
                          height: 1.w,
                          width: 334.w,
                        );
                      },
                    )),
              );
            },
            id: 'updateUI',
          )
        ],
      ),
    );
  }


  Widget _topTagWidget({
    required String title,
    String image = 'ic_mx_sx1',
    Color color = Colors.black,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BaseText(
          text: title,
          color: color,
          fontSize: 12.w,
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.w, left: 4.w),
          child: Image(
            image: image.png3x,
            width: 10.w,
            height:10.w,
          ),
        )
      ],
    ).withPadding(
      right: 12.w,
    );
  }
}

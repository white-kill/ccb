import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/scale_point_widget.dart';
import '../../../../index/index_logic.dart';
import '../component/account_details_item_widget.dart';
import '../component/bill_filter_widget.dart';
import '../component/details_picker/details_piceker.dart';
import 'component/details_picker/details_piceker.dart';
import 'component/new_picker/new_picker.dart';
import 'detail_more_time_logic.dart';
import 'detail_more_time_state.dart';

class DetailMoreTimePage extends BaseStateless {
  DetailMoreTimePage({super.key}) : super(title: '账户明细');

  final DetailMoreTimeLogic logic = Get.put(DetailMoreTimeLogic());
  final DetailMoreTimeState state = Get.find<DetailMoreTimeLogic>().state;


  @override
  Color? get backColor => Colors.black;

  @override
  Color? get navColor => const Color(0xFFF7F7F7);

  void jumpPage(String name){
    SmartDialog.dismiss();
    if(name == '流水打印'){
      AppPages.toPrintView();
    }
    if(name == '建行客服'){
      Get.toNamed(Routes.ccbCustomerPage,);
    }
    if(name == '首页'){
      Get.offAllNamed(Routes.tabs);
      final IndexLogic logic = Get.put(IndexLogic());
      logic.selectIndex(0);
    }
    if(name == '消息'){
      Get.toNamed(Routes.mineMessagePage,);
    }

  }


  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_mx_search'.png3x,
      width: 18.w,
      height: 18.w,
    ).withOnTap(onTap: () {
      Get.toNamed(Routes.detailSearchPage);
    }).withPadding(
      right: 20.w,
    ),
    ScalePointWidget(
      left:110.w,
      dx: 60.w,
      width: 130.w,
      content:   ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Map<String,dynamic> data = state.rightDataList[index];
            return Row(
              children: [
                Image(
                  image: data['icon'].toString().png3x,
                  width: 16.w,
                  height: 16.w,
                  color: Colors.black,
                ).withPadding(
                  left: 4.w,
                  right: 10.w,
                ),
                BaseText(
                  text: data['name'],
                  color: Colors.black,
                )
              ],
            ).withContainer(
                padding: EdgeInsets.all(10.w),
                height: 40.w, alignment: Alignment.centerLeft).withOnTap(onTap: (){
              jumpPage(data['name']);
            });
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              color: const Color(0xffdedede),
            );
          },
          itemCount: state.rightDataList.length),
    ).withPadding(right: 16.w),
  ];


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
          _topWidget(),
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
                GetBuilder(
                  builder: (DetailMoreTimeLogic c) {
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
                          text:logic.checkCurrentMonth(state.monthTime1.timeDrop2),
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
                  NewMorePicker.showNewTime(newHeadNotifier: state.newHeaderNotifier);
                }),
                GetBuilder(
                  builder: (DetailMoreTimeLogic c) {
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
                              text: "¥${state.expensesTotal}",
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
                              text: "¥${state.incomeTotal}",
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
            builder: (DetailMoreTimeLogic c) {
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

  Widget _topWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            state.infoModel.bankList.isEmpty
                ? const SizedBox.shrink()
                : _topTagWidget(
              title:
              '${state.infoModel.bankList.first.bankName}(${state.infoModel.bankList.first.bankCard.getLastFourByList()})',
            ).withOnTap(onTap: () {
              BaseBottomSheet.sheetContentWidget(
                  title: "账户选择",
                  child: Column(
                    children: state.infoModel.bankList.map((e) {
                      return Row(
                        children: [
                          SizedBox(width: 24.w),
                          Image(
                            image: 'ic_jsyh'.png3x,
                            width: 30.w,
                            height: 30.w,
                          ),
                          SizedBox(width: 6.w),
                          BaseText(
                            text:
                            "${e.bankName}(${e.bankCard.getLastFourByList()})",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xff3F61C5),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ).withPadding(top: 12.w, bottom: 10.w);
                    }).toList(),
                  ));
            }),
            SizedBox(
              width: 8.w,
            ),
            _topTagWidget(title: '活期储蓄').withOnTap(onTap: () {
              BaseBottomSheet.sheetContentWidget(
                  title: "选择子账户",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: "人民币 活期储蓄 活期",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xff3F61C5),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      BaseText(
                        text: "开户日期 2015/02/01",
                        color: Color(0xff666666),
                        fontSize: 12,
                      ),
                    ],
                  ).withPadding(top: 12.w, left: 20.w, bottom: 10.w));
            }),
          ],
        ),
        Row(
          children: [
            GetBuilder(
              builder: (DetailMoreTimeLogic c) {
                return _topTagWidget(
                    title: '筛选',
                    // image: 'ic_mx_sx1',
                    color: state.handleSelList.isNotEmpty
                        ? Colors.blue
                        : Colors.black)
                    .withOnTap(onTap: () {
                  BaseBottomSheet.sheetContentWidget(
                      title: "筛选", child: const BillFilterWidget());
                });
              },
              id: 'updateFilter',
            ),
            SizedBox(
              width: 25.w,
            ),
            GetBuilder(
              builder: (DetailMoreTimeLogic c) {
                return _topTagWidget(
                    title: '时间',
                    image: state.orderSort == '2'?'ic_mx_sx2':'ic_mx_sx3',
                    color:
                    state.orderSort == '2' ? Colors.blue : Colors.black)
                    .withOnTap(onTap: () {
                  state.orderSort = state.orderSort == '1' ? '2' : '1';
                  c.getListData(isRef: true);
                  c.update(['updateTime']);
                });
              },
              id: 'updateTime',
            ),
          ],
        ),
      ],
    );
  }

  Widget _topTagWidget({
    required String title,
    String image = 'ic_mx_sx1',
    Color color = Colors.black,
  }) {
    bool _show = (title == '时间');
    return Row(
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
            width: _show ? 10.w : 8.w,
            height: _show ? 10.w : 8.w,
          ),
        )
      ],
    );
  }
}

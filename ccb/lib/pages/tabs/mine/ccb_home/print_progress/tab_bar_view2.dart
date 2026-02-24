import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/pages/tabs/mine/ccb_home/print_progress/print_progress_info/print_progress_info_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../data/model/flow_list_model.dart';

class TabBarView2 extends StatefulWidget {
  const TabBarView2({super.key});

  @override
  State<TabBarView2> createState() => _TabBarView2State();
}

class _TabBarView2State extends State<TabBarView2>with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;
  RefreshController refreshController = RefreshController();

  int pageNum = 1;

  //状态 为空全部 0处理中 1已寄出 2已完成
  void getData() {
    Http.get(Apis.flowExport, queryParameters: {
      'pageNum': pageNum,
      'pageSize': 10,
      'status': '0',
    }).then((v) {
      if (v != 0) {
        listModel = FlowListModel.fromJson(v);
        if (pageNum == 1) {
          list = listModel.list;
          refreshController.refreshCompleted();
        } else {
          list = list + listModel.list;
          refreshController.loadComplete();
        }
        setState(() {});
      }
    });
  }

  void onRefresh() {
    pageNum = 1;
    getData();
  }

  void onLoading() {
    pageNum++;
    getData();
  }

  FlowListModel listModel = FlowListModel();

  List<FlowListList> list = [];

  Widget refreshWidget({child}) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Column(
            children: [
              SizedBox(height: 100.w,),
              Image(
                image: 'p_zwt'.png3x,
                width: 1.sw * 0.66,
                height: 1.sw * 0.66,
              ),
              // SizedBox(
              //   height: 12.w,
              // ),
              // BaseText(
              //   text: '没有查询到符合条件的明细记录',
              //   fontSize: 12.sp,
              //   color: Color(0xff999999),
              // ),
            ],
          )
        : refreshWidget(
            child: ListView.builder(
            itemBuilder: (context, index) {
              FlowListList model = list[index];
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(12.w),
                margin: EdgeInsets.only(bottom: 10.w, left: 10.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: model.busType,
                          fontSize: 15.sp,
                        ),
                        BaseText(
                          text: '处理中',
                          color: Color(0xFF3040A5),
                        ),
                      ],
                    ),
                    BaseText(
                      text: model.bankCard.maskBankCardNumber(),
                      color: Color(0xff666666),
                    ).withPadding(
                      top: 10.w,
                      bottom: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: '提交日期：${model.createTime}',
                          color: Color(0xff666666),
                        ),
                        BaseText(
                          text: '提取码：${model.code}',
                          color: Color(0xff666666),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    Divider(
                      color: Color(0x668C8C8C),
                      height: 0.5.w,
                      thickness: 1,
                    ).withPadding(top: 12.w, bottom: 12.w),
                    SizedBox(
                      height: 4.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(text: model.method),
                        // Container(
                        //   width: 65.w,
                        //   height: 24.w,
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     gradient: const LinearGradient(
                        //       begin: Alignment.centerLeft,
                        //       end: Alignment.centerRight,
                        //       colors: [Color(0xff3768CB), Color(0xff6FACF9)], // 渐变色列表
                        //     ),
                        //     borderRadius: BorderRadius.all(Radius.circular(2.w)),
                        //   ),
                        //   child: BaseText(
                        //     text: "评价",
                        //     fontSize: 12.sp,
                        //     color: Colors.white,
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                  ],
                ),
              ).withOnTap(onTap: () {
                Get.to(() => PrintProgressInfoPage(),
                    arguments: {'model': model.detail});
              });
            },
            itemCount: list.length,
          ));
  }
}

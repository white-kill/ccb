import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../data/model/transfer_record_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/scale_point_widget.dart';
import 'transfer_record_logic.dart';
import 'transfer_record_state.dart';

class TransferRecordPage extends BaseStateless {
  TransferRecordPage({Key? key}) : super(key: key, title: '转账记录');

  final TransferRecordLogic logic = Get.put(TransferRecordLogic());
  final TransferRecordState state = Get.find<TransferRecordLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;
  @override
  get refreshController => state.refreshController;

  @override
  List<Widget>? get rightAction => [
        ScalePointWidget(
          left: 110.w,
          dx: 55.w,
          width: 130.w,
          icColor: Colors.white,
        ).withPadding(right: 16.w),
      ];

  @override
  void onLoading() {
    super.onLoading();
    state.redData.pageNum ++;
    logic.recordData();

  }

  @override
  bool get enablePullDown => false;

  @override
  Widget initBody(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Builder(builder: (context) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 1.sw,
                height: 50.w,
                color: Colors.white,
                padding: EdgeInsets.only(left: 18.w, right: 18.w),
                child: GetBuilder(
                  builder: (TransferRecordLogic c) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: state.title1.maskBankCardNumber(),
                              fontSize: 12.sp,
                              color: const Color(0xff666666),
                            ),
                            Image(
                              image: 'ic_zz_record_more'.png3x,
                              width: 12.w,
                              height: 20.w,
                              color: const Color(0xff666666),
                            )
                          ],
                        ).withOnTap(
                          onTap: () => logic.attachA(context, '1'),
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: logic.displayTimeText,
                              fontSize: 12.sp,
                              color: const Color(0xff666666),
                            ),
                            Image(
                              image: 'ic_zz_record_more'.png3x,
                              width: 12.w,
                              height: 20.w,
                              color: const Color(0xff666666),
                            )
                          ],
                        ).withOnTap(
                          onTap: () => logic.attachA(context, '2'),
                        ),
                        BaseText(
                          text: '筛选',
                          fontSize: 12.sp,
                          color: const Color(0xff666666),
                        ).withOnTap(onTap: () {
                          logic.openPermanentDialog();
                        }),
                      ],
                    );
                  },
                  id: 'updateTop',
                ),
              ),
              Divider(
                color: const Color(0xff999999),
                height: 1.w,
              ),
            ]);
          }),
          Row(
            children: [
              Image(
                image: 'ic_search'.png3x,
                width: 17.w,
                height: 17.w,
                color: const Color(0xff666666),
              ).withPadding(
                left: 12.w,
                right: 10.w,
              ),
              TextFieldWidget(
                controller: state.searchController,
                hintText: '请输入收款户名/账号/手机号/附言搜索',
                hintStyle: TextStyle(fontSize: 12.sp, color: const Color(0xff999999)),
                onChanged: (value) => logic.onSearchChanged(value),
              ).withContainer(
                width: 280.w,
              )
            ],
          ).withContainer(
              margin: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 10.w,
                bottom: 10.w,
              ),
              height: 32.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.w)), color: Colors.white
                  // border: Border.all(
                  //   color: const Color(0xff999999),
                  //   width: 1.w,
                  // )
                  )),
          GetBuilder(
            builder: (TransferRecordLogic c) {
              // 如果没有数据，显示空状态
              if (logic.modelList.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: 'trans_history_empty'.png,
                          width: 50.w,
                          height: 50.w,
                        ),
                        SizedBox(height: 20.w),
                        Text(
                          '没有查到符合条件的转账记录',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              
              return Expanded(
                child: refreshWidget(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      TransferRecordList model = logic.modelList[index];
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: 60.w,
                        ),
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 15.w, right: 15.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 105.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BaseText(
                                        text: model.transactionTime,
                                        fontSize: 12.sp,
                                      ),
                                      SizedBox(
                                        height: 6.w,
                                      ),
                                      BaseText(
                                        text: model.dateTime,
                                        fontSize: 12.sp,
                                        color: Color(0xff666666),
                                      ),
                                    ],
                                  ),
                                  NetImageWidget(
                                    url: model.icon,
                                    width: 25.w,
                                    height: 25.w,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 130.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BaseText(
                                    text: model.oppositeName,
                                    maxLines: 10,
                                  ),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  BaseText(
                                    text: model.oppositeAccount.maskBankCardNumber(),
                                    fontSize: 11.sp,
                                    color: Color(0xff666666),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BaseText(text: model.amount.bankBalance, color: Colors.blueAccent),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  BaseText(
                                    text: model.currency,
                                    fontSize: 11.sp,
                                    color: Color(0xff666666),
                                  )
                                ],
                              ),
                            ),
                            Image(
                              image: 'ic_zz_record_next'.png3x,
                              width: 14.w,
                              height: 12.w,
                              color: Color(0xff666666),
                            )
                          ],
                        ),
                      ).withOnTap(onTap: () {
                        Get.toNamed(Routes.transferDetailPage, arguments: {
                          'id': model.id,
                          'detail': model.detail,
                        });
                      });
                    },
                    itemCount: logic.modelList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Color(0xff999999),
                        height: 1.w,
                      );
                    },
                  )
                ),
              );
            },
            id: 'updateUI',
          ),
        ],
      ),
    );
  }
}

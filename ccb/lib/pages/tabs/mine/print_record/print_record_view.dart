import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'print_record_logic.dart';
import 'print_record_state.dart';

class PrintRecordPage extends BaseStateless {
  PrintRecordPage({Key? key}) : super(key: key, title: '申请记录查询');

  final PrintRecordLogic logic = Get.put(PrintRecordLogic());
  final PrintRecordState state = Get.find<PrintRecordLogic>().state;

  @override
  List<Widget>? get rightAction => [
        Icon(
          Icons.clear,
          size: 24.w,
          color: Colors.black,
        ).withPadding(right: 16.w).withOnTap(onTap: (){
          Get.back();
        }),
      ];


  @override
  get refreshController => state.refreshController;

  @override
  void onRefresh() {
    super.onRefresh();
    state.pageNum = 1;
    logic.applyPage();
  }

  @override
  void onLoading() {
    super.onLoading();
    state.pageNum++;
    logic.applyPage(isRef: false);
  }


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
                color: const Color.fromARGB(255, 243, 247, 249),
                padding: EdgeInsets.only(left: 35.w, right: 35.w),
                child: GetBuilder(
                  builder: (PrintRecordLogic c) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: state.title1,
                              fontSize: 14.sp,
                                color: const Color.fromARGB(255, 91, 116, 189)
                            ),
                            Image(
                              image: 'ic_zz_record_more'.png3x,
                              width: 14.w,
                              height: 20.w,
                                color: const Color.fromARGB(255, 91, 116, 189)
                            )
                          ],
                        ).withOnTap(
                          onTap: () => logic.attachA(context, '1'),
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: state.title2.maskBankCardNumber(),
                              fontSize: 14.sp,
                                color: const Color.fromARGB(255, 91, 116, 189)
                            ),
                            Image(
                              image: 'ic_zz_record_more'.png3x,
                              width: 14.w,
                              height: 20.w,
                                color: const Color.fromARGB(255, 91, 116, 189)
                            )
                          ],
                        ).withOnTap(
                          onTap: () => logic.attachA(context, '2'),
                        ),
                        Row(
                          children: [
                            BaseText(
                                text: state.title3,
                                fontSize: 14.sp,
                                color: const Color.fromARGB(255, 91, 116, 189)),
                            Image(
                                image: 'ic_zz_record_more'.png3x,
                                width: 14.w,
                                height: 20.w,
                                color: const Color.fromARGB(255, 91, 116, 189))
                          ],
                        ).withOnTap(
                          onTap: () => logic.attachA(context, '3'),
                        ),
                      ],
                    );
                  },
                  id: 'updateTop',
                ),
              ),
            ]);
          }),
          GetBuilder(
            builder: (PrintRecordLogic c) {
              return Expanded(
                child: refreshWidget(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int idx) {
                      return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              constraints: BoxConstraints(
                                minHeight: 34.w,
                              ),
                              padding: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BaseText(text: state.nameLis[index],color: Color(0xff666666),),

                                  SizedBox(width:35.w),


                                  state.nameLis[index] == '解压密码'?Row(
                                    children: [
                                      BaseText(text:  logic.valueName(state.nameLis[index], state.list[idx]),style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      )),
                                      SizedBox(width: 20.w,),
                                      BaseText(text: '点击复制',color: Colors.blueAccent,fontSize: 12.sp,).withOnTap(onTap: (){
                                        logic.copyToClipboard( logic.valueName(state.nameLis[index], state.list[idx]));
                                      }),
                                    ],
                                  ).withSizedBox(width: 200.w): BaseText(
                                    text: logic.valueName(state.nameLis[index], state.list[idx]),
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontWeight: state.nameLis[index] == '当前状态'?FontWeight.bold:FontWeight.normal,
                                        fontSize: state.nameLis[index] == '当前状态'?14.sp:14.sp,
                                        color:  state.nameLis[index] == '当前状态'?Colors.black:Color(0xff666666)
                                    ),
                                  ).withSizedBox(width: 200.w)
                                ],
                              ),
                            );
                          },
                          itemCount: state.nameLis.length)
                          .withContainer(
                        color: Colors.white,);
                    },
                    itemCount: state.list.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Color(0xFFF7F7F7),
                        height: 10.w,
                      );
                    },
                  ),
                )
              );
            },
            id: 'updateUI',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import 'print_progress_info_logic.dart';
import 'print_progress_info_state.dart';

class PrintProgressInfoPage extends BaseStateless {
  PrintProgressInfoPage({Key? key}) : super(key: key, title: '进度查询');

  final Print_progress_infoLogic logic = Get.put(Print_progress_infoLogic());
  final Print_progress_infoState state =
      Get.find<Print_progress_infoLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  Widget? get leftItem => Image(
        image: 'ic_left_back_home'.png3x,
        width: 42.w,
        height: 30.w,
      )
          .withPadding(left: 10.w)
          .withOnTap(onTap: () => Get.offAndToNamed(Routes.ccbHomePage));

  @override
  List<Widget>? get rightAction => [
        Container(
          width: 85.w,
          height: 32.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'ic_min_right'.png3x,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container().withOnTap(onTap: () {
                BaseBottomSheet.sheetContentWidget(
                    bgColor: const Color.fromARGB(255, 240, 240, 240),
                    topWidget: Image(
                      image: 'ic_jhdj_left1'.png3x,
                    ).withPadding(left: 12.w, right: 12.w).withContainer(
                          height: 68.w,
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 1.sw,
                          height: 0.5.w,
                          color: const Color.fromARGB(255, 235, 235, 235),
                        ),
                        Image(
                          image: 'ic_jhdj_left2'.png3x,
                        ).withPadding(left: 12.w, right: 12.w),
                        Container(
                          height: 42.w,
                          alignment: Alignment.center,
                          child: BaseText(
                            text: "取消",
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ).withOnTap(onTap: () {
                          Get.back();
                        }),
                      ],
                    ));
                // Get
              })),
              Expanded(
                  child: Container().withOnTap(onTap: () {
                Get.back();
              })),
            ],
          ),
        ).withPadding(right: 10.w),
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 50.w,
                    child: Row(
                      children: [
                        BaseText(
                          text: state.titleNames[index],
                          color: Color(0xff666666),
                        ).withContainer(width: 130.w),
                        BaseText(
                          text: logic.valueStr(state.titleNames[index]),
                          color: Color(0xff666666),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: 345.w,
                    height: 0.8.w,
                    color: const Color(0xffE9E9E9),
                  );
                },
                itemCount: state.titleNames.length)
            .withContainer(
          margin: EdgeInsets.all(10.w),
          padding: EdgeInsets.only(left: 15.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.w))),
        ),
        SizedBox(
          height: 55.w,
        ),
        BaseText(
          text: '评价',
          fontSize: 15.sp,
          color: Color(0xFF3040A5),
        ).withContainer(width: 1.sw, alignment: Alignment.center),
      ],
    );
  }
}

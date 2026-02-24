import 'package:ccb/pages/tabs/mine/turnover_print/paper_print/notice/view.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:ccb/utils/stack_position.dart';

import 'logic.dart';
import 'state.dart';

class PaperPrintPage extends BaseStateless {
  PaperPrintPage({Key? key}) : super(key: key, title: "流水打印");

  final PaperPrintLogic logic = Get.put(PaperPrintLogic());
  final PaperPrintState state = Get.find<PaperPrintLogic>().state;

  @override
  Color? get navColor => const Color(0xff283CB1);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;

  @override
  // TODO: implement title
  String? get title => "流水打印";

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
                Get.offAllNamed(Routes.tabs);
              })),
            ],
          ),
        ).withPadding(right: 10.w),
      ];

  var selected = false.obs;

  @override
  Widget initBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image(
            image: "paper_print".png,
            width: 1.sw,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
            child: Container(
          width: 1.sw,
          height: 50.w,
        ).withOnTap(onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Image(image: "paper_print_bottom".png).withOnTap(
                    onTap: () {
                  Get.back();
                });
              });
        })),
        // Positioned(
        //     top: 180.w,
        //     child: Container(
        //       width: 1.sw,
        //       height: 20.w,
        //     ).withOnTap(onTap: () {
        //       Get.to(() => PaperPrintNoticePage());
        //     })),
        Positioned(
            top: 208.w,
            left: 19.w,
            child: Obx(() {
              return Container(
                  width: 20.w,
                  height: 20.w,
                  child: selected.value
                      ? Icon(Icons.check_circle,
                          size: 17.w, color: const Color(0xff283CB1))
                      : SizedBox());
            })),
        Positioned(
            top: 230.w,
            left: 19.w,
            child: Obx(() {
              return Container(
                  width: 20.w,
                  height: 20.w,
                  child: selected.value
                      ? Icon(Icons.check_circle,
                          size: 17.w, color: const Color(0xff283CB1))
                      : SizedBox());
            })),
        Positioned(
            top: 210.w,
            left: 19.w,
            child: Container(
              width: 1.sw,
              height: 50.w,
            ).withOnTap(onTap: () {
              selected.value = !selected.value;
            })),
        Positioned(
            top: 210.w,
            left: 45.w,
            child: Container(
              width: 1.sw,
              height: 20.w,
            ).withOnTap(onTap: () {
              Get.to(() => PaperPrintNoticePage());
            })),

        Obx(() {
          return Positioned(
            bottom: 0,
            child: Container(
              width: 350.w,
              height: 42.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected.value ? null : const Color(0xffC5D9F8),
                gradient: selected.value
                    ? const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff3768CB), Color(0xff6FACF9)], // 渐变色列表
                      )
                    : null,
                borderRadius: BorderRadius.all(Radius.circular(6.w)),
              ),
              margin: EdgeInsets.only(
                  left: 12.w,
                  right: 12.w,
                  top: 10.w,
                  bottom: ScreenUtil().bottomBarHeight + 10.w),
              child: BaseText(
                text: "提交申请",
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
          );
        })
      ],
    );
  }
}

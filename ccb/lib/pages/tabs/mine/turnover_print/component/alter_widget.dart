import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/bottom_sheet_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class AlterWidget {

  static bottomAlter(List listName,{
    Function(int index)? onSelectedItemChanged,
    Function? onTap,
  }){
    BaseBottomSheet.sheetContentWidget(
      topWidget: const SizedBox.shrink(),
        showLine: false,
        child:Column(
          children: [
            Container(
              width: 1.sw,
              height: 200.w,
              child: CupertinoPicker(
              itemExtent: 42.w,
              onSelectedItemChanged:onSelectedItemChanged,
              selectionOverlay: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
                    bottom:
                    BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
                  ),
                ),
              ),
              children: listName.map((year) {
                return Center(
                  child: Text(
                    '$year',
                    style:  TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),),

            Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                    child: Container(
                      height: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        color: Colors.white,
                        border: Border.all(
                          width: 0.5,
                          color: const Color(0xffdedede)
                        )
                      ),
                      child: BaseText(
                        text: '取消',
                        fontSize: 16.sp,
                      ),
                    ).withOnTap(onTap: (){
                      Get.back();
                    })),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                    child: Container(
                      height: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 130, 248),
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: BaseText(
                        text: '确定',
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ).withOnTap(onTap: (){
                      onTap?.call();
                      Get.back();
                    })),

                SizedBox(
                  width: 24.w,
                ),
              ],
            ).withPadding(
                bottom:12.w
            )
          ],
        ));
  }


  static alterWidget({required Widget Function(BuildContext context) builder,bool clickMaskDismiss=false}){
    SmartDialog.show(
      usePenetrate: false,
      clickMaskDismiss: clickMaskDismiss,
      builder:builder,
    );
  }

}
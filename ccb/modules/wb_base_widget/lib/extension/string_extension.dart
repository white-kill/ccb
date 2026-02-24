import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../component/wb_loading_widget.dart';
import '../text_widget/bank_text.dart';

extension ToastExtension on String {
  void get showLoading {
    SmartDialog.showLoading(
        builder: (_) => WbLoadingWidget(
              image: 'ic_loading1'.png3x,
              loadingText: this == '' ? '正在加载' : this,
            ));
  }

  //
  void get showLoading2 {
    SmartDialog.showLoading(
        builder: (_) => WbLoadingWidget(
          image: 'ic_loading2'.png3x,
          imageSize: 46,
          duration: const Duration(milliseconds: 1600),
          loadingText: this == '' ? '正在加载' : this,
        ));
  }
  void get showToast => SmartDialog.showToast(this,
          alignment: Alignment.center,
          displayType: SmartToastType.last, builder: (_) {
        return Container(
          constraints: BoxConstraints(
            minWidth: 120.w,
            maxWidth: ScreenUtil().screenWidth - 80.w,
            maxHeight: 80.h,
          ),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseText(
                text: this,
                fontSize: 15,
                color: Colors.white,
              )
            ],
          ),
        );
      });

  void dialog({
    String? title,
    Color? titleColor,
    Widget? sure,
    Widget? cancel,
    bool showCancel = true,
    TextStyle? contentStyle,
    TextAlign contentAlign = TextAlign.center,
    Function(bool dis)? onBack,
  }) =>
      SmartDialog.show(
        usePenetrate: false,
        clickMaskDismiss: false,
        builder: (_) {
          return Container(
            width: 1.sw * 0.88,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.w),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title == null
                    ? const SizedBox.shrink()
                    : BaseText(
                        text: title,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: titleColor ?? Colors.blue,
                        ),
                      ).withPadding(top: 12.w),
                BaseText(
                  maxLines: 20,
                  text: this,
                  style: contentStyle,
                  textAlign: contentAlign,
                )
                    .withContainer(
                      width: 1.sw * 0.7,
                      alignment: Alignment.center,
                    )
                    .withPadding(
                        top: title == null ? 16.w : 12.w,
                        bottom: 16.w,
                        left: 16.w,
                        right: 16.w),
                Container(
                  width: 1.sw * 0.88,
                  height: 0.5.w,
                  color: const Color(0xffbbbbab),
                ),
                SizedBox(
                  height: 42.w,
                  width: 1.sw * 0.8,
                  child: Row(
                    children: [
                      showCancel
                          ? Expanded(
                              child: Container(
                              alignment: Alignment.center,
                              child: (cancel ??
                                  const BaseText(
                                    text: '取消',
                                  )),
                            ).withOnTap(onTap: () {
                              onBack?.call(false);
                              SmartDialog.dismiss();
                            }))
                          : SizedBox.shrink(),
                      showCancel
                          ? Container(
                              width: 0.5.w,
                              height: 42.w,
                              color: const Color(0xffbbbbab),
                            )
                          : SizedBox.shrink(),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: (sure ??
                            const BaseText(
                              text: '确定',
                              color: Color(0xFF3040A5),
                            )),
                      ).withOnTap(onTap: () {
                        onBack?.call(true);
                        SmartDialog.dismiss();
                      })),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );

  String? get toPrice => contains(".0") ? substring(0, indexOf('.')) : this;
}

extension DateExtension on String {
  String get timeDrop1 =>
      replaceAll('年', '.').replaceAll('月', '.').replaceAll('日', '');

  String get timeDrop2 => replaceAll('年', '.').replaceAll('月', '');

  String maskBankCardNumber(
      {int prefixLength = 4, int suffixLength = 4, String maskChar = '*'}) {
    if (isEmpty || length < prefixLength + suffixLength) {
      return this;
    }

    final prefix = substring(0, prefixLength);
    final suffix = substring(length - suffixLength);

    return '$prefix***$suffix';
  }
  String maskBankCardNumber2(
      {int prefixLength = 4, int suffixLength = 4, String maskChar = '*'}) {
    if (isEmpty || length < prefixLength + suffixLength) {
      return this;
    }

    final prefix = substring(0, prefixLength);
    final suffix = substring(length - suffixLength);

    return '$prefix *** $suffix';
  }

  String formatBankCardNumber() {
    if (isEmpty) return this;

    // 移除所有非数字字符
    final cleaned = replaceAll(RegExp(r'[^\d]'), '');

    // 每4位加一个空格
    final buffer = StringBuffer();
    for (int i = 0; i < cleaned.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(cleaned[i]);
    }
    return buffer.toString();
  }

  String getLastFourByList() {
    final chars = split('');
    return chars.length >= 4 ? chars.sublist(chars.length - 4).join() : this;
  }

  String desensitize(
      {int prefixLen = 4, int suffixLen = 4, String replaceChar = '*'}) {
    if (length <= prefixLen + suffixLen) return this;

    String prefix = substring(0, prefixLen);
    String suffix = substring(length - suffixLen);
    String middle = replaceChar * (length - prefixLen - suffixLen);

    return '$prefix$middle$suffix';
  }

  String removeFirstChar() {
    if (isEmpty) return this;
    return substring(1);
  }
}

extension RandomNumber on Random {
  String nextVerificationCode(int length) {
    const chars = '0123456789';
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(nextInt(chars.length)),
      ),
    );
  }

  String nextTwoDigitString() {
    const digits = '0123456789';
    return digits[nextInt(9) + 1] + digits[nextInt(10)];
  }
}

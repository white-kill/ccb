import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../data/model/bill_list_model.dart';

class AccountDetailsItemWidget extends StatefulWidget {
  final BillListList model;

  const AccountDetailsItemWidget({super.key, required this.model});

  @override
  State<AccountDetailsItemWidget> createState() =>
      _AccountDetailsItemWidgetState();
}

class _AccountDetailsItemWidgetState extends State<AccountDetailsItemWidget> {
  // String type(String type) {
  //   if (type == '1') {
  //     return '+';
  //   }
  //   if (type == '2') {
  //     return '';
  //   }
  //   return '';
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.w + ((widget.model.day != '') ? 54.w : 0),
      width: 1.sw,
      padding: EdgeInsets.only(left: 12.w, right: 4.w, top: 15.w),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.model.day != ''
              ? Container(
                  color: const Color(0xffEEEEEE),
                  margin: EdgeInsets.only(top: 14.w),
                  height: 15.w,
                  padding: EdgeInsets.only(
                      left: 4.w, right: 4.w, top: 1.w, bottom: 1.w),
                  child: BaseText(
                    text: widget.model.day,
                    fontSize: 9.sp,
                    color: const Color(0xff333333),
                  ),
                )
              : const SizedBox.shrink(),
          widget.model.day != ''
              ? SizedBox(
                  height: 16.w,
                )
              : const SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: widget.model.excerpt,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff333333),
                ),
              ),
              BaseText(
                text: '¥ ${widget.model.amount}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                  color: const Color(0xff333333),
                ),
              ).withPadding(right: 30.w),
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: widget.model.merchantBranch,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff999999)),
              ).withSizedBox(width: 180.w),
              Row(
                children: [
                  Text('余额: ￥',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff999999),
                          height: 1)),
                  Text(widget.model.accountBalance,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff999999),
                          height: 1)),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image(
                    image: 'ic_zh_mx_next'.png3x,
                    width: 20.w,
                    height: 20.w,
                    color: const Color(0xff999999),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

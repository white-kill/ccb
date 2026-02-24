import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_transfer_logic.dart';

class ContactsTransferWidget extends StatefulWidget {
  const ContactsTransferWidget({super.key});

  @override
  State<ContactsTransferWidget> createState() => _ContactsTransferWidgetState();
}

class _ContactsTransferWidgetState extends State<ContactsTransferWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AccountTransferLogic c) {
      return Container(
        margin: EdgeInsets.only(top: 12.w, right: 18.w, left: 18.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.w),
          ),
        ),
        child: Row(
          children: [
            NetImageWidget(
              url: c.model?.icon ?? '',
              width: 35.w,
              height: 35.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BaseText(
                  text: "转给 ${c.model?.name ?? ''}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4.w,
                ),
                SizedBox(
                  width: 1.sw - 102.w,
                  child: BaseText(
                    text:
                        '${c.model?.bankName}（${c.model?.bankCard.formatBankCardNumber()}）',
                    fontSize: 12,
                    maxLines: 2,
                    color: Color(0xff999999),
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}

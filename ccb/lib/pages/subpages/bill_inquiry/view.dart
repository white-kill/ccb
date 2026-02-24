import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class BillInquiryPage extends BaseStateless {
  final logic = Get.put(BillInquiryLogic());

  BillInquiryPage({super.key});

  @override
  String? get title => '账单查询';

  @override
  Widget initBody(BuildContext context) {
    return const Center(
      child: Text('账单查询页面正在建设中...'),
    );
  }
} 
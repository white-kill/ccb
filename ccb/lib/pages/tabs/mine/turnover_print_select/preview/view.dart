import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../../../generated/assets.dart';
import 'logic.dart';
import 'state.dart';

class PrintPreviewPage extends StatelessWidget {
  PrintPreviewPage({Key? key}) : super(key: key);

  final PrintPreviewLogic logic = Get.put(PrintPreviewLogic());
  final PrintPreviewState state = Get.find<PrintPreviewLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Image(image: "print_preview".png),
        ),
        // 添加gif加载动画
        Container(
          child: Image.asset(
            Assets.gifPrintLoading,
            width: 60.w,
          ),
        ),
      ],
    );
  }
}

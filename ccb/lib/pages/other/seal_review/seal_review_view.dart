import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../utils/scale_point_widget.dart';
import 'seal_review_logic.dart';
import 'seal_review_state.dart';

class SealReviewPage extends BaseStateless {
  SealReviewPage({Key? key}) : super(key: key,title: '合同专用章查验');

  final SealReviewLogic logic = Get.put(SealReviewLogic());
  final SealReviewState state = Get.find<SealReviewLogic>().state;

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 6.w),
    Icon(
      Icons.clear,
      color: Colors.black,
    ).withOnTap(onTap: () {
      Get.back();
    }).withPadding(
      right: 16.w,
    )
  ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'ht_jy'.png3x,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

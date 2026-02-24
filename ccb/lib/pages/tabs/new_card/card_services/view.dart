import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';

class CardServicesPage extends BaseStateless {
  CardServicesPage({Key? key}) : super(key: key);

  final CardServicesLogic logic = Get.put(CardServicesLogic());

  @override
  String get title => '卡服务';

  @override
  Color get navColor => Colors.white;

  @override
  Widget? get leftItem => IconButton(
        icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
        onPressed: () => Get.back(),
      );

  @override
  List<Widget>? get rightAction => [
    ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 10.w, left: 10.w),
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F6F6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/new_images/card/card_services/tab_card_security.png', fit: BoxFit.fitWidth),
            Image.asset('assets/new_images/card/card_services/tab_card_services.png', fit: BoxFit.fitWidth),
            Image.asset('assets/new_images/card/card_services/tab_my_bills.png', fit: BoxFit.fitWidth),
            Image.asset('assets/new_images/card/card_services/tab_want_to_installment.png', fit: BoxFit.fitWidth),
            Image.asset('assets/new_images/card/card_services/my_app_section.png', fit: BoxFit.fitWidth),
          ],
        ),
      ),
    );
  }
} 
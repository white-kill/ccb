import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class FeeUnitSelectionPage extends BaseStateless {
  final logic = Get.put(FeeUnitSelectionLogic());

  FeeUnitSelectionPage({super.key});

  @override
  String? get title => '选择缴费单位';

  @override
  Color? get navColor => const Color(0xFF0E67E9);

  @override
  Color? get backColor => Colors.white;

  @override
  Color? get titleColor => Colors.white;

  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w, color: Colors.white,),
    onPressed: () => Get.back(),
  );

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/life/children/fee.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 
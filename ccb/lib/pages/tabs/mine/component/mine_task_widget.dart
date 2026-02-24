import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../../routes/app_pages.dart';

class MineTaskWidget extends StatefulWidget {
  const MineTaskWidget({super.key});

  @override
  State<MineTaskWidget> createState() => _MineTaskWidgetState();
}

class _MineTaskWidgetState extends State<MineTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return _containerBg(
      width: screenWidth,
      height: screenWidth/3240 * 1053,
      imagePath: 'bg_mine_task',
    ).withOnTap(onTap: ()=>Get.toNamed(Routes.mineTaskPage,));
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF6FCFF).withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}

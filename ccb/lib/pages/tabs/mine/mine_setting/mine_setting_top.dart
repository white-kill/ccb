import 'package:ccb/pages/tabs/mine/component/mine_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class MineSettingTopWidget extends StatefulWidget {
  const MineSettingTopWidget({super.key});

  @override
  State<MineSettingTopWidget> createState() => _MineSettingTopWidgetState();
}

class _MineSettingTopWidgetState extends State<MineSettingTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 200.w,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: 'bg_mine_top'.png3x,
          fit: BoxFit.cover,
        ),
      ),
      child: const MineInfoWidget(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class TargetPage extends StatefulWidget {
  const TargetPage({super.key});

  @override
  State<TargetPage> createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _showFullScreenBottomSheet();
    });
  }

  void _showFullScreenBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // 透明背景
      builder: (context) {
        //final screenSize = MediaQuery.of(context).size;
        return ListView(
          //shrinkWrap: true,
          physics: const ClampingScrollPhysics(), // 更流畅的滚动效果
          children: [
            Container(
              color: Colors.black.withOpacity(0.1),
              child: Image(image: ('bg_yibaoma').png3x),
            ).withOnTap(onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white, // 关键设置
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black, // 统一设置返回键和菜单图标颜色
          ),
          title: const Text(
            '医保',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          )),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

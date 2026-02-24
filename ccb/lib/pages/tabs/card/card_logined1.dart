import 'package:flutter/material.dart';
import 'package:ccb/utils/common_banner_widget.dart';

class Card_loginedPage1 extends StatelessWidget {
  const Card_loginedPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBannerWidget(
      imagePaths: const [
        'card/segment_1_banner_1',
        'card/segment_1_banner_2',
        'card/segment_1_banner3',
      ],
      aspectRatio: 375 / 349,
      autoPlay: true,
      fit: BoxFit.fill,
    );
  }
}

import 'package:ccb/pages/tabs/wealth/children/lccp/view.dart';
import 'package:flutter/material.dart';
import '../bx/state.dart';
import '../wdlc/view.dart';

class LcPage extends StatefulWidget {
  const LcPage({Key? key}) : super(key: key);

  @override
  State<LcPage> createState() => _LcPageState();
}

class _LcPageState extends State<LcPage> {
  int _selectedIndex = 0;

  final List<TabItem> tabItems = [
    TabItem(
      title: '理财产品',
      selectedIcon: 'assets/new_images/cai_fu/children/lccp_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/lccp_icon_unsel.png',
    ),
    TabItem(
      title: '我的理财',
      selectedIcon: 'assets/new_images/cai_fu/children/wdlc_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/wdlc_icon_unsel.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget content = _selectedIndex == 0 ? LccpPage() : WdlcPage();
    return Column(
      children: [
        Expanded(child: content),
        Container(
          color: Colors.white,
          height: 60,
          child: Row(
            children: [
              _buildTabButton('理财产品', tabItems[0], 0),
              _buildTabButton('我的理财', tabItems[1], 1),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String text, TabItem icon, int index) {
    final bool selected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              selected ? icon.selectedIcon : icon.unselectedIcon,
              width: 24,
              height: 24,
            ),
            SizedBox(height: 2),
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                color: selected ? Colors.blue : Colors.black45,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
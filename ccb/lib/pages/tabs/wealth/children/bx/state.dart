class TabItem {
  final String title;
  final String selectedIcon;
  final String unselectedIcon;

  TabItem({
    required this.title,
    required this.selectedIcon,
    required this.unselectedIcon,
  });
}

class BaoXianMainState {
  final List<TabItem> tabItems = [
    TabItem(
      title: '首页',
      selectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_sy_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_sy_icon_unsel.png',
    ),
    TabItem(
      title: '消息',
      selectedIcon: 'assets/new_images/cai_fu/children/bx/bx_wdbd_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/bx/bx_wdbd_icon_unsel.png',
    ),
  ];

  BaoXianMainState() {
    ///Initialize variables
  }
} 
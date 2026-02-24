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

class GuiJinShuMainState {
  GuiJinShuMainState() {
    ///Initialize variables
  }

  final List<TabItem> tabItems = [
    TabItem(
      title: '首页',
      selectedIcon: 'assets/new_images/cai_fu/children/gjs/home_selected.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/gjs/home_normal.png',
    ),
    TabItem(
      title: '持有',
      selectedIcon: 'assets/new_images/cai_fu/children/gjs/hold_selected.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/gjs/hold_normal.png',
    ),
  ];
} 
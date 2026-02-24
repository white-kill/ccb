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

class JiJinTouZiMainState {
  final List<TabItem> tabItems = [
    TabItem(
      title: '首页',
      selectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_sy_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_sy_icon_unsel.png',
    ),
    TabItem(
      title: '市场',
      selectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_sc_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_sc_icon_unsel.png',
    ),
    TabItem(
      title: '关注',
      selectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_gz_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_gz_icon_unsel.png',
    ),
    TabItem(
      title: '持有',
      selectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_cy_icon_sel.png',
      unselectedIcon: 'assets/new_images/cai_fu/children/jjtz/jjtz_cy__icon_unsel.png',
    ),
  ];

  JiJinTouZiMainState() {
    ///Initialize variables
  }
}

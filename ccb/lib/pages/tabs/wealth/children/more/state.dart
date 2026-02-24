class MoreState {
  int selectedTabIndex = 0;
  
  // 精选产品数据
  final List<Map<String, String>> featuredItems = [
    {'image': 'assets/new_images/cai_fu/children/more/ckcp.png', 'label': '存款产品'},
    {'image': 'assets/new_images/cai_fu/children/more/lccp.png', 'label': '理财产品'},
    {'image': 'assets/new_images/cai_fu/children/more/jjtz.png', 'label': '基金投资'},
    {'image': 'assets/new_images/cai_fu/children/more/bx.png', 'label': '保险'},
    {'image': 'assets/new_images/cai_fu/children/more/gjs.png', 'label': '贵金属'},
    {'image': 'assets/new_images/cai_fu/children/more/jhyx.png', 'label': '建行严选'},
    {'image': 'assets/new_images/cai_fu/children/more/lqb1h.png', 'label': '龙钱宝1号'},
    {'image': 'assets/new_images/cai_fu/children/more/lqb2h.png', 'label': '龙钱宝2号'},
    {'image': 'assets/new_images/cai_fu/children/more/sy.png', 'label': '速盈'},
  ];

  // 基金/证券/理财产品数据
  final List<Map<String, String>> fundItems = [
    {'image': 'assets/new_images/cai_fu/children/more/sy.png', 'label': '速盈'},
    {'image': 'assets/new_images/cai_fu/children/more/jjtz.png', 'label': '基金投资'},
    {'image': 'assets/new_images/cai_fu/children/more/lccp.png', 'label': '理财产品'},
    {'image': 'assets/new_images/cai_fu/children/more/zhlc.png', 'label': '专户理财'},
    {'image': 'assets/new_images/cai_fu/children/more/ylbzcp.png', 'label': '养老保障产品'},
    {'image': 'assets/new_images/cai_fu/children/more/qhzgcp.png', 'label': '期货资管产品'},
    {'image': 'assets/new_images/cai_fu/children/more/lb.png', 'label': '龙宝'},
    {'image': 'assets/new_images/cai_fu/children/more/dlxt.png', 'label': '代理信托'},
    {'image': 'assets/new_images/cai_fu/children/more/zqqh.png', 'label': '证券期货'},
    {'image': 'assets/new_images/cai_fu/children/more/ylzt.png', 'label': '(原)龙智投'},
    {'image': 'assets/new_images/cai_fu/children/more/bnh.png', 'label': '帮你还'},
  ];

  // 标签页数据
  final List<String> tabItems = [
    '基金/证券/理财',
    '存款/保险/外汇',
    '贵金属',
    '私募产品',
    '其他'
  ];

  MoreState() {
    // Initialize variables
  }
} 
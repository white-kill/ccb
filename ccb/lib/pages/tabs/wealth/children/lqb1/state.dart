class Lqb1State {
  // 产品信息
  String productName = '龙钱宝1号';
  String yieldRate = '1.58%';
  String yieldDescription = '平均7日年化收益率';
  
  // 产品特性
  List<String> features = [
    '1分起购',
    '风险级别低', 
    '零钱管理',
    '随时购买'
  ];

  // 推荐产品
  List<Map<String, String>> recommendProducts = [
    {
      'title': '颗粒归仓',
      'subtitle': '7.22%起 大额活期',
    },
    {
      'title': '安心稳健', 
      'subtitle': '风险级别低 稳健理财产品',
    },
    {
      'title': '想花就花',
      'subtitle': '支付便捷 想花钱立即到账',
    },
  ];

  Lqb1State() {
    // Initialize variables
  }
} 
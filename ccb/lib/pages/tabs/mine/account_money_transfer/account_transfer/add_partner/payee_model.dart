class PayeeModel {
  final String name;           // 收款户名
  final String account;        // 收款账号
  final String bankName;       // 收款银行名称
  final String bankUrl;        // 收款银行图标URL
  final String bankId;         // 收款银行ID
  final String? branch;        // 收款网点（可选）
  final String? phone;         // 短信通知手机号（可选）
  final String? alias;         // 别名（可选）
  final DateTime createdAt;    // 创建时间

  PayeeModel({
    required this.name,
    required this.account,
    required this.bankName,
    required this.bankUrl,
    required this.bankId,
    this.branch,
    this.phone,
    this.alias,
    required this.createdAt,
  });

  // 从JSON创建对象
  factory PayeeModel.fromJson(Map<String, dynamic> json) {
    return PayeeModel(
      name: json['name'] ?? '',
      account: json['account'] ?? '',
      bankName: json['bankName'] ?? '',
      bankUrl: json['bankUrl'] ?? '',
      bankId: json['bankId'] ?? '',
      branch: json['branch'],
      phone: json['phone'],
      alias: json['alias'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'account': account,
      'bankName': bankName,
      'bankUrl': bankUrl,
      'bankId': bankId,
      'branch': branch,
      'phone': phone,
      'alias': alias,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // 转换为 ContactInfo 用于在收款人名册中显示
  Map<String, dynamic> toContactInfoJson() {
    return {
      'name': alias?.isNotEmpty == true ? '$name($alias)' : name,  // 如果有别名，显示格式：真名(别名)
      'icon': bankUrl,                 // 使用银行图标URL
      'id': account,                   // 使用账号作为唯一ID
      'bankCard': account,             // 银行卡号
      'bankName': branch?.isNotEmpty == true ? '$bankName($branch)' : bankName,  // 如果有网点，显示格式：银行(网点)
      'bankId': bankId,                // 银行ID
    };
  }

  // 用于调试的字符串表示
  @override
  String toString() {
    return 'PayeeModel{name: $name, account: $account, bankName: $bankName, bankUrl: $bankUrl, bankId: $bankId, branch: $branch, phone: $phone, alias: $alias, createdAt: $createdAt}';
  }
}

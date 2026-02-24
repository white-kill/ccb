import 'package:ccb/config/app_config.dart';

/// 格式化手机号码为 "188 8888 8888" 格式
String formatPhoneNumber(String phone) {
  if (phone.length != 11) return phone;
  return '${phone.substring(0, 3)} ${phone.substring(3, 7)} ${phone.substring(7)}';
}

String secretPhoneNumber(String phone) {
  if (phone.length != 11) return phone;
  return '${phone.substring(0, 3)}****${phone.substring(7)}';
}

String secretPhoneNumberFour(String phone) {
  if (phone.length != 11) return phone;
  return '${phone.substring(0, 4)}***${phone.substring(7)}';
}

/// 格式化身份证号码脱敏显示，前3位 + *** + 后4位
String formatIDNumber(String idCard) {
  if (idCard.length < 7) return idCard; // 如果长度不够，直接返回原值
  
  // 身份证号码通常是18位，保留前3位和后4位
  if (idCard.length == 18) {
    String prefix = idCard.substring(0, 3);
    String suffix = idCard.substring(14); // 后4位
    return '$prefix***********$suffix'; // 中间11个星号
  }
  
  // 其他长度的证件号码，保留前3位和后4位
  String prefix = idCard.substring(0, 3);
  String suffix = idCard.substring(idCard.length - 4);
  String stars = '*' * (idCard.length - 7); // 中间部分星号数量
  return '$prefix$stars$suffix';
}

/// 格式化身份证号码脱敏显示，前3位 + *** + 后4位
String formatIDNumberSmall(String idCard) {
  if (idCard.length < 7) return idCard; // 如果长度不够，直接返回原值

  // 身份证号码通常是18位，保留前3位和后4位
  if (idCard.length == 18) {
    String prefix = idCard.substring(0, 3);
    String suffix = idCard.substring(14); // 后4位
    return '$prefix***$suffix'; // 中间11个星号
  }

  // 其他长度的证件号码，保留前3位和后4位
  String prefix = idCard.substring(0, 3);
  String suffix = idCard.substring(idCard.length - 4);
  return '$prefix***$suffix';
}


/// 格式化银行卡信息，包含银行名称和卡号
String formatBankCard(int index) {
  if (AppConfig.config.balanceLogic.memberInfo.bankList.isEmpty || 
      index >= AppConfig.config.balanceLogic.memberInfo.bankList.length) return '';
      
  final bankInfo = AppConfig.config.balanceLogic.memberInfo.bankList[index];
  if (bankInfo.bankName.isEmpty || bankInfo.bankCard.isEmpty) return '';
  
  final cardNumber = bankInfo.bankCard;
  if (cardNumber.length < 8) return '';
  
  String firstFour = cardNumber.substring(0, 4);
  String lastFour = cardNumber.substring(cardNumber.length - 4);
  return '${bankInfo.bankName}   $firstFour***$lastFour';
}



/// 格式化银行卡信息，包含银行名称和卡号
String getBankInfo() {
  if (AppConfig.config.balanceLogic.memberInfo.bankList.isEmpty) return '';
  final bankInfo = AppConfig.config.balanceLogic.memberInfo.bankList[0];
  if (bankInfo.bankName.isEmpty || bankInfo.bankCard.isEmpty) return '';
  return '${bankInfo.bankName}   ${formatBankCard(0)}';
}

String getBankNo() {
  if (AppConfig.config.balanceLogic.memberInfo.bankList.isEmpty ||
      0 >= AppConfig.config.balanceLogic.memberInfo.bankList.length) return '';

  final bankInfo = AppConfig.config.balanceLogic.memberInfo.bankList[0];
  if (bankInfo.bankName.isEmpty || bankInfo.bankCard.isEmpty) return '';

  final cardNumber = bankInfo.bankCard;
  if (cardNumber.length < 8) return '';

  String firstFour = cardNumber.substring(0, 4);
  String lastFour = cardNumber.substring(cardNumber.length - 4);

  return "$firstFour***$lastFour";
}
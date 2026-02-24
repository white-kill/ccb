import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'send_message_state.dart';

class SendMessageLogic extends GetxController {
  final SendMessageState state = SendMessageState();


  Future<void> sendSms() async {
    // 接收方电话号码
    const phoneNumber = '95533';
    // 短信内容（可选）
    const message = '建行转账';

    // 构造短信URI
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );

    // 尝试启动短信应用
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw '无法打开短信应用';
    }
  }
}

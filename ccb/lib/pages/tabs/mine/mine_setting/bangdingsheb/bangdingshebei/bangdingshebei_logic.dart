import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import 'bangdingshebei_state.dart';

class BangdingshebeiLogic extends GetxController {
  final BangdingshebeiState state = BangdingshebeiState();
  // 设备信息
  final RxString deviceModel = ''.obs;
  final RxString osVersion = ''.obs;
  final RxString deviceInfo = ''.obs;
  final RxMap<String, dynamic> allDeviceInfo = <String, dynamic>{}.obs;
  @override
  void onInit() async {
    await getDeviceInfo();
    super.onInit();
  }

  /// 获取设备信息 - 使用最新的 device_info_plus API
  Future<void> getDeviceInfo() async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();

      // 获取通用设备信息
      final deviceInfoData = await deviceInfoPlugin.deviceInfo;
      allDeviceInfo.value = deviceInfoData.data;

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;

        // 使用最新的 API 属性
        final brand = androidInfo.brand;
        final model = androidInfo.model;
        final manufacturer = androidInfo.manufacturer;
        final androidVersion = androidInfo.version.release;
        final sdkInt = androidInfo.version.sdkInt;

        deviceModel.value = '$brand $model';
        osVersion.value = 'Android $androidVersion';
        deviceInfo.value = '${deviceModel.value} · ${osVersion.value}';

        print('===== Android 设备信息 =====');
        print('品牌: $brand');
        print('型号: $model');
        print('制造商: $manufacturer');
        print('Android版本: $androidVersion');
        print('SDK版本: $sdkInt');
        print('完整信息: ${deviceModel.value} · ${osVersion.value}');
        print('所有设备数据: ${allDeviceInfo.value}');
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;

        // 使用最新的 iOS API
        final name = iosInfo.name;
        final model = iosInfo.model;
        final systemName = iosInfo.systemName;
        final systemVersion = iosInfo.systemVersion;
        final localizedModel = iosInfo.localizedModel;

        deviceModel.value = '$name ($localizedModel)';
        osVersion.value = '$systemName $systemVersion';
        deviceInfo.value = '${deviceModel.value} · ${osVersion.value}';

        print('===== iOS 设备信息 =====');
        print('设备名称: $name');
        print('型号: $model');
        print('本地化型号: $localizedModel');
        print('系统名称: $systemName');
        print('系统版本: $systemVersion');
        print('完整信息: ${deviceModel.value} · ${osVersion.value}');
        print('所有设备数据: ${allDeviceInfo.value}');
      } else {
        // 其他平台 (Web, Windows, macOS, Linux)
        deviceModel.value = '其他平台设备';
        osVersion.value = Platform.operatingSystem;
        deviceInfo.value = '${deviceModel.value} · ${osVersion.value}';

        print('===== 其他平台设备信息 =====');
        print('平台: ${Platform.operatingSystem}');
        print('所有设备数据: ${allDeviceInfo.value}');
      }
    } catch (e) {
      print('获取设备信息失败: $e');
      deviceModel.value = '未知设备';
      osVersion.value = '未知系统';
      deviceInfo.value = '设备信息获取失败';
      allDeviceInfo.value = {'error': e.toString()};
    }
  }

  /// 获取设备详细信息的格式化字符串
  String getFormattedDeviceInfo() {
    return deviceInfo.value;
  }

  /// 获取所有设备信息的 Map
  Map<String, dynamic> getAllDeviceData() {
    return allDeviceInfo.value;
  }

}

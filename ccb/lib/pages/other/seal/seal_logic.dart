import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import 'seal_state.dart';

class SealLogic extends GetxController {
  final SealState state = SealState();

  String formattedDate = '';

  @override
  void onInit() {
    super.onInit();

    var formatter = DateFormat('yyyyMMdd');
    formattedDate = formatter.format(DateTime.now());
  }

  void d(String url){
  }
  Future<void> downloadAndSharePdf(String url) async {
    '下载中...'.showLoading;
    final Dio dio = Dio();
    try {
      // if (Platform.isAndroid) {
      //   final status = await Permission.storage.request();
      //   if (!status.isGranted) {
      //     await SmartDialog.dismiss(status: SmartStatus.loading);
      //     '存储权限被拒绝'.showToast;
      //     throw Exception('存储权限被拒绝');
      //   }
      //   final manageExternalStorageStatus = await Permission.manageExternalStorage.request();
      //   if (!manageExternalStorageStatus.isGranted) {
      //     '存储权限被拒绝'.showToast;
      //     throw Exception('存储权限被拒绝');
      //   }
      // }

      // 2. 获取本地存储路径
      final dir = Platform.isAndroid
          ? await getExternalStorageDirectory() // Android 使用外部存储
          : await getApplicationDocumentsDirectory(); // iOS 使用应用目录
      final savePath = '${dir?.path}/电子印章.pdf';

      // 3. 使用 dio 下载文件
      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print('下载进度: ${(received / total * 100).toStringAsFixed(0)}%');
          }
        },
      );
      await SmartDialog.dismiss(status: SmartStatus.loading);

      final file = File(savePath);
      if (!await file.exists()) {
        throw Exception('文件下载失败');
      }

      final params = ShareParams(
        files:[XFile(savePath)],
        title: '电子印章.pdf',
        subject: '电子印章.pdf',
      );
      await SharePlus.instance.share(params);
    } catch (e) {
      await SmartDialog.dismiss(status: SmartStatus.loading);
      '打开失败'.showToast;
    }
  }
}

import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

import 'package:ccb/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../config/dio/network.dart';
import '../../../../config/net_config/apis.dart';
import '../../../../data/model/transfer_info_model.dart';
import 'mine_receipt_state.dart';
import 'dart:ui' as ui;


class MineReceiptLogic extends GetxController {
  final MineReceiptState state = MineReceiptState();



  var showCardNumber = false.obs;

  bool show = false;

  @override
  void onInit() {
    super.onInit();
    show = Get.arguments['show']??false;
    // detailData();
    state.infoModel = Get.arguments['info'];
    if(state.infoModel.merchantBranch == ''){
      state.nameList.remove('附言');
    }
    update(['updateUI']);
  }

  void detailData(){
    Http.get(Apis.transferInfo,queryParameters: {
      'id':Get.arguments['id']
    }).then((v){
      if(v != null){
        state.infoModel = TransferInfoModel.fromJson(v);
        if(state.infoModel.merchantBranch == ''){
          state.nameList.remove('附言');
        }
      }
      update(['updateUI']);
    });
  }


  String valueName(int index) {
    switch (index) {
      case 0:
        return state.infoModel.transactionTime;
      case 1:
        return state.infoModel.transactionType;
      case 2:
        return state.infoModel.transactionChannel;
      case 3:
        return'¥ ${ state.infoModel.amount.bankBalance}';
      case 4:
        return convertToChineseAmount(state.infoModel.amount);
      case 5:
        return state.infoModel.certificateNo;
      case 6:
        return '';
      case 7:
        return state.infoModel.oppositeName;
      case 8:
        return formatCardNumber(state.infoModel.oppositeAccount);
      case 9:
        return state.infoModel.bankName;
      case 11:
        return AppConfig.config.balanceLogic.memberInfo.bankList.first.realName;
      case 12:
        if(showCardNumber.value){
          return formatCardNumber(AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard);
        }else {
          return AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard.maskBankCardNumber();

        }
      default:
        return '';
    }
  }

  String valueName1(int index) {
    switch (index) {
      case 0:
        return state.infoModel.transactionTime;
      case 1:
        return state.infoModel.transactionType;
      case 2:
        return state.infoModel.transactionChannel;
      case 3:
        return'¥ ${ state.infoModel.amount.bankBalance}';
      case 4:
        return convertToChineseAmount(state.infoModel.amount);
      case 5:
        return  state.infoModel.merchantBranch;
      case 6:
        return state.infoModel.certificateNo;
      case 7:
        return '';
      case 8:
        return state.infoModel.oppositeName;
      case 9:
        return formatCardNumber(state.infoModel.oppositeAccount);
      case 10:
        return state.infoModel.bankName;
      case 11:
        return '';
      case 12:
        return AppConfig.config.balanceLogic.memberInfo.bankList.first.realName;
      case 13:
        if(showCardNumber.value){
          return formatCardNumber(AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard);
        }else {
          return AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard.maskBankCardNumber();

        }
      default:
        return '';
    }
  }

  Future<Uint8List?> capturePng({required GlobalKey globalKey}) async {
    try {
      var findRenderObject = globalKey.currentContext!.findRenderObject();
      RenderRepaintBoundary boundary =
      findRenderObject as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      return null;
    }
  }

  Future savePngImage(Uint8List value) async{
    // 获取应用的临时目录
    final directory = await getTemporaryDirectory();
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    // 为图片创建文件路径
    final filePath = '${directory.path}/ccb_${timestamp.toString()}_share.png';

    // 创建文件并将 Uint8List 写入文件
    final file = File(filePath);
    await file.writeAsBytes(value);
    // 使用 gallery_saver 插件将图片保存到相册
    return GallerySaver.saveImage(filePath);
  }


  String formatCardNumber(String cardNumber) {
    String digitsOnly = cardNumber.replaceAll(RegExp(r'[^\d]'), '');
    StringBuffer formatted = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted.write(' ');
      }
      formatted.write(digitsOnly[i]);
    }

    return formatted.toString();
  }


  String convertToChineseAmount(double amount) {
    // 检查金额是否为非负数
    if (amount < 0) {
      throw ArgumentError("金额不能为负数");
    }

    // 拆分为整数部分和小数部分
    int integerPart = amount.floor();
    int decimalPart = ((amount - integerPart) * 100).round();

    // 处理整数部分
    String integerStr = _convertIntegerPart(integerPart);
    // 处理小数部分
    String decimalStr = _convertDecimalPart(decimalPart);

    // 拼接结果
    String result = "人民币 $integerStr";
    if (decimalStr.isNotEmpty) {
      result += decimalStr;
    } else {
      result += "整"; // 如果没有小数部分，加"整"
    }

    return result;
  }

  /// 转换整数部分（元）
  String _convertIntegerPart(int number) {
    if (number == 0) {
      return "零元";
    }

    const List<String> units = ["", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿", "拾", "佰", "仟", "兆"];
    const List<String> digits = [
      "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"
    ];

    String str = number.toString();
    String result = "";
    bool lastIsZero = true; // 上一位是否是零
    bool hasZeroInSection = false; // 当前节（万/亿）内是否有零

    for (int i = 0; i < str.length; i++) {
      int digit = int.parse(str[i]);
      int unitIndex = str.length - i - 1;
      String currentDigit = digits[digit];
      String currentUnit = units[unitIndex];

      if (digit == 0) {
        // 当前位是零
        if (!lastIsZero) {
          hasZeroInSection = true;
          lastIsZero = true;
        }

        // 在万、亿等单位处需要特殊处理
        if (unitIndex == 4 || unitIndex == 8) { // 万位或亿位
          if (result.isNotEmpty && !result.endsWith("亿") && !result.endsWith("万")) {
            result += currentUnit;
          }
          lastIsZero = true; // 重置零标记
          hasZeroInSection = false;
        }
      } else {
        // 当前位不是零
        // 如果之前有零且不是开头，需要补"零"
        if (hasZeroInSection && result.isNotEmpty && !result.endsWith("万") && !result.endsWith("亿")) {
          result += "零";
        }
        result += currentDigit + currentUnit;
        lastIsZero = false;
        hasZeroInSection = false;
      }
    }

    // 清理末尾可能多余的零
    while (result.endsWith("零")) {
      result = result.substring(0, result.length - 1);
    }

    return result + "元";
  }

  /// 转换小数部分（角、分）
  String _convertDecimalPart(int decimal) {
    if (decimal == 0) {
      return ""; // 如果没有小数部分，返回空（整数部分已加"整"）
    }

    const List<String> units = ["角", "分"];
    const List<String> digits = [
      "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"
    ];

    String result = "";
    String decimalStr = decimal.toString().padLeft(2, '0');

    for (int i = 0; i < decimalStr.length; i++) {
      int digit = int.parse(decimalStr[i]);
      if (digit != 0) {
        result += digits[digit] + units[i];
      } else if (i == 0 && result.isEmpty) {
        // 如果角是零但分不是零，需要添加"零"
        if (int.parse(decimalStr[1]) != 0) {
          result += "零";
        }
      }
    }

    return result;
  }
  

  Future<Uint8List> loadImageFromAssets() async {
    ByteData data = await rootBundle.load('assets/images/hd_shear_bottom@2x.png');
    return data.buffer.asUint8List();
  }


  void stitchImagesVertically(Uint8List data1,) async {
    try {
      // 读取并解码图片
      final topImage = await decodeImageFromList(data1);
      final bottomImage = await decodeImageFromList(await loadImageFromAssets());

      // 创建拼接后的画布
      final combinedWidth = topImage.width;
      final combinedHeight = topImage.height + bottomImage.height;

      final ui.PictureRecorder recorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(recorder);

      // 绘制顶部图片
      final Paint paint = Paint();
      canvas.drawImage(topImage, Offset.zero, paint);

      final double scaleRatio = topImage.width / bottomImage.width;
      final double scaledHeight = bottomImage.height * scaleRatio;
      // 绘制底部图片（在顶部图片下方）

      canvas.save();
      canvas.translate(0, topImage.height.toDouble() - 1);
      canvas.scale(scaleRatio, scaleRatio);
      canvas.drawImage(bottomImage, Offset.zero, paint);
      canvas.restore();
      // canvas.drawImage(
      //     bottomImage,
      //     Offset(0, topImage.height.toDouble() - 1),
      //     paint
      // );

      // 生成拼接后的图片
      final ui.Image combinedImage = await recorder.endRecording().toImage(
          combinedWidth,
          combinedHeight
      );

      // 转换为字节数据
      final ByteData? byteData = await combinedImage.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;
      await savePngImage(byteData.buffer.asUint8List());
      '保存成功'.showToast;
      // 保存拼接后的图片
    } catch (e) {
      print('Error stitching images: $e');
      return null;
    }
  }


}



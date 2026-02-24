import 'dart:io';

import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/pages/tabs/mine/ccb_home/print_progress/print_progress_info/print_progress_info_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../data/model/flow_list_model.dart';

class TabBarView1 extends StatefulWidget {
  const TabBarView1({super.key});

  @override
  State<TabBarView1> createState() => _TabBarView1State();
}

class _TabBarView1State extends State<TabBarView1>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  RefreshController refreshController = RefreshController();

  String typeName(String statue) {
    if (statue == '0') {
      return '处理中';
    }
    if (statue == '1') {
      return '已寄出';
    }
    if (statue == '2') {
      return '已完成';
    }
    return '';
  }

  /// 计算剩余有效天数（4天倒计时，超过返回0）
  int getRemainingDays(String? createTime) {
    if (createTime == null || createTime.isEmpty) return 0;
    try {
      // 支持 "2025/12/07" 和 "2025-12-07" 两种格式
      final normalizedTime = createTime.replaceAll('/', '-');
      final createDate = DateTime.parse(normalizedTime);
      final now = DateTime.now();
      final difference = now.difference(createDate).inDays;
      final remaining = 4 - difference;
      return remaining > 0 ? remaining : 0;
    } catch (e) {
      return 0;
    }
  }

  int pageNum = 1;

  //状态 为空全部 0处理中 1已寄出 2已完成
  void getData() {
    Http.get(Apis.flowExport, queryParameters: {
      'pageNum': pageNum,
      'pageSize': 10,
      'status': '',
    }).then((v) {
      if (v != 0) {
        listModel = FlowListModel.fromJson(v);
        if (pageNum == 1) {
          list = listModel.list;
          refreshController.refreshCompleted();
        } else {
          list = list + listModel.list;
          if (list.length == listModel.total) {
            refreshController.loadNoData();
          } else {
            refreshController.loadComplete();
          }
        }
        setState(() {});
      }
    });
  }

  void onRefresh() {
    pageNum = 1;
    getData();
  }

  void onLoading() {
    pageNum++;
    getData();
  }

  FlowListModel listModel = FlowListModel();

  List<FlowListList> list = [];

  /// 下载文件并打开
  Future<void> downloadFile(List<String> fileUrls) async {
    if (fileUrls.isEmpty) {
      '暂无文件'.showToast;
      return;
    }

    try {
      '下载中...'.showLoading;
      final Dio dio = Dio();

      // 获取保存路径
      final dir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      // 下载第一个文件
      final fileUrl = fileUrls.first;
      final fileName = 'hqmx_${DateFormat('yyyyMMddHHmmss').format(DateTime.now())}.pdf';
      final savePath = '${dir?.path}/Download/ccb/$fileName';

      // 确保目录存在
      final saveDir = Directory('${dir?.path}/Download/ccb');
      if (!await saveDir.exists()) {
        await saveDir.create(recursive: true);
      }

      // 下载文件
      await dio.download(
        fileUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print('下载进度: ${(received / total * 100).toStringAsFixed(0)}%');
          }
        },
      );

      await SmartDialog.dismiss(status: SmartStatus.loading);

      // 检查文件是否存在
      final file = File(savePath);
      if (!await file.exists()) {
        throw Exception('文件下载失败');
      }

      // 显示保存成功的对话框，等待用户点击确定
      final shouldShare = await showSaveSuccessDialog(savePath);

      // 用户点击确定后，使用 share_plus 打开文件
      if (shouldShare == true) {
        final params = ShareParams(
          files: [XFile(savePath)],
          title: fileName,
          subject: fileName,
        );
        await SharePlus.instance.share(params);
      }
    } catch (e) {
      await SmartDialog.dismiss(status: SmartStatus.loading);
      '下载失败'.showToast;
      print('下载错误: $e');
    }
  }

  /// 显示文件保存成功的对话框
  Future<bool?> showSaveSuccessDialog(String filePath) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              '提示',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          content: Text(
            '文件已保存：$filePath',
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xff666666),
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);  // 返回 true 表示用户点击了确定
                },
                child: Text(
                  '确定',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff4A6FCD),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget refreshWidget({child}) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return list.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 100.w,
              ),
              Image(
                image: 'p_zwt'.png3x,
                width: 1.sw * 0.66,
                height: 1.sw * 0.66,
              ),
              // SizedBox(
              //   height: 12.w,
              // ),
              // BaseText(
              //   text: '没有查询到符合条件的明细记录',
              //   fontSize: 12.sp,
              //   color: Color(0xff999999),
              // ),
            ],
          )
        : refreshWidget(
            child: ListView.builder(
            itemBuilder: (context, index) {
              FlowListList model = list[index];
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(12.w),
                margin: EdgeInsets.only(bottom: 10.w, left: 10.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: model.busType,
                          fontSize: 15.sp,
                        ),
                        BaseText(
                          text: typeName(model.status),
                          color: Color(0xFF3040A5),
                        ),
                      ],
                    ),
                    BaseText(
                      text: model.bankCard.maskBankCardNumber(),
                      color: Color(0xff666666),
                    ).withPadding(
                      top: 10.w,
                      bottom: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: '提交日期：${model.createTime}',
                          color: Color(0xff666666),
                        ),
                        if (model.type == "0")
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            height: 24.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.w),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff4A6FCD),
                                      Color(0xff81AEF4),
                                    ])),
                            child: BaseText(
                              text: '查看文件',
                              fontSize: 13.sp,
                              color: Colors.white,
                            ),
                          ).withOnTap(onTap: () {
                            // 下载文件
                            downloadFile(model.fileUrlList);
                          })
                        else
                          BaseText(
                            text: '提取码：${model.code}',
                            color: Color(0xff666666),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    Divider(
                      color: Color(0x668C8C8C),
                      height: 0.5.w,
                      thickness: 1,
                    ).withPadding(top: 12.w, bottom: 12.w),
                    SizedBox(
                      height: 4.w,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (model.type == "1")
                            BaseText(text: model.method)
                            else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(text: "在线查看"),
                                SizedBox(height: 12.w,),
                                BaseText(text: "文件有效期为${getRemainingDays(model.createTime)}天，过期请重新申请", style: TextStyle(
                                  fontSize: 14.w,
                                  color: Color(0xFF767477)
                                ),)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                  ],
                ),
              ).withOnTap(onTap: () {
                Get.to(() => PrintProgressInfoPage(),
                    arguments: {'model': model.detail});
              });
            },
            itemCount: list.length,
          ));
  }
}

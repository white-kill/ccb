import 'package:ccb/pages/tabs/mine/component/mine_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ccb/config/app_config.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sp_util/sp_util.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:ccb/utils/stack_position.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';

class MineTopWidget extends StatefulWidget {
  const MineTopWidget({super.key});

  @override
  State<MineTopWidget> createState() => _MineTopWidgetState();
}

class _MineTopWidgetState extends State<MineTopWidget> {
  // 自定义数值 key
  static const String _keyBankCard = 'mine_custom_bankCard';
  static const String _keyCoupon = 'mine_custom_coupon';
  static const String _keyCredit = 'mine_custom_credit';
  // 自动缓存 key（登录后自动保存，重启后恢复）
  static const String _cacheName = 'mine_cache_name';
  static const String _cacheBankCard = 'mine_cache_bankCard';
  static const String _cachePoints = 'mine_cache_points';
  static const String _cacheCoupon = 'mine_cache_coupon';
  static const String _cacheCredit = 'mine_cache_credit';
  static const String _cacheLoginTime = 'mine_cache_loginTime';

  List infoDataList = [
    {'name': '银行卡'},
    {'name': '积分'},
    {'name': '优惠券'},
    {'name': '信用卡权益'},
  ];

  String? _localBankCard;
  String? _localCoupon;
  String? _localCredit;

  @override
  void initState() {
    super.initState();
    _localBankCard = SpUtil.getString(_keyBankCard);
    _localCoupon = SpUtil.getString(_keyCoupon);
    _localCredit = SpUtil.getString(_keyCredit);
  }

  /// 当 memberInfo 有真实数据时，自动缓存到本地
  void _autoCacheIfNeeded(BalanceLogic c) {
    if (c.memberInfo.realName.isNotEmpty) {
      SpUtil.putString(_cacheName, c.memberInfo.realName);
      SpUtil.putString(_cacheBankCard, c.memberInfo.bankList.length.toString());
      SpUtil.putString(_cachePoints, c.memberInfo.points);
      SpUtil.putString(_cacheCoupon, c.memberInfo.couponsNum);
      SpUtil.putString(_cacheCredit, c.memberInfo.credit.isEmpty ? "0" : c.memberInfo.credit);
      SpUtil.putString(_cacheLoginTime, c.memberInfo.loginTime);
    }
  }

  String _getDisplayName(BalanceLogic c) {
    String realName = c.memberInfo.realName;
    if (realName.isNotEmpty) {
      return "*${realName.removeFirstChar()}";
    }
    // 重启后 memberInfo 为空，从缓存恢复
    String? cached = SpUtil.getString(_cacheName);
    if (cached != null && cached.isNotEmpty) {
      return "*${cached.removeFirstChar()}";
    }
    return '';
  }

  String _getDisplayLoginTime(BalanceLogic c) {
    if (c.memberInfo.loginTime.isNotEmpty) return c.memberInfo.loginTime;
    return SpUtil.getString(_cacheLoginTime) ?? '';
  }

  String getNumber(String name, BalanceLogic c) {
    if (name == '银行卡') {
      if (_localBankCard != null && _localBankCard!.isNotEmpty) return _localBankCard!;
      if (c.memberInfo.bankList.isNotEmpty) return c.memberInfo.bankList.length.toString();
      return SpUtil.getString(_cacheBankCard, defValue: '0') ?? '0';
    }
    if (name == '积分') {
      if (c.memberInfo.points.isNotEmpty) return c.memberInfo.points;
      return SpUtil.getString(_cachePoints) ?? '0';
    }
    if (name == '优惠券') {
      if (_localCoupon != null && _localCoupon!.isNotEmpty) return _localCoupon!;
      if (c.memberInfo.couponsNum.isNotEmpty) return c.memberInfo.couponsNum;
      return SpUtil.getString(_cacheCoupon, defValue: '0') ?? '0';
    }
    if (name == '信用卡权益') {
      if (_localCredit != null && _localCredit!.isNotEmpty) return _localCredit!;
      if (c.memberInfo.credit.isNotEmpty) return c.memberInfo.credit;
      return SpUtil.getString(_cacheCredit, defValue: '0') ?? '0';
    }
    return '0';
  }

  void _showCustomNumberDialog(BalanceLogic c) {
    final bankCardCtrl = TextEditingController(text: getNumber('银行卡', c));
    final couponCtrl = TextEditingController(text: getNumber('优惠券', c));
    final creditCtrl = TextEditingController(text: getNumber('信用卡权益', c));

    Get.dialog(
      AlertDialog(
        title: Text('自定义数字', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInputRow('银行卡', bankCardCtrl),
            SizedBox(height: 12.w),
            _buildInputRow('优惠券', couponCtrl),
            SizedBox(height: 12.w),
            _buildInputRow('信用卡权益', creditCtrl),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('取消', style: TextStyle(fontSize: 14.sp, color: Color(0xff666666))),
          ),
          TextButton(
            onPressed: () {
              SpUtil.putString(_keyBankCard, bankCardCtrl.text);
              SpUtil.putString(_keyCoupon, couponCtrl.text);
              SpUtil.putString(_keyCredit, creditCtrl.text);
              _localBankCard = bankCardCtrl.text;
              _localCoupon = couponCtrl.text;
              _localCredit = creditCtrl.text;
              setState(() {});
              Get.back();
            },
            child: Text('确定', style: TextStyle(fontSize: 14.sp, color: Color(0xff3C6DD3))),
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow(String label, TextEditingController controller) {
    return Row(
      children: [
        SizedBox(
          width: 80.w,
          child: Text(label, style: TextStyle(fontSize: 14.sp)),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.w),
              ),
            ),
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  void jumpPage(String name) {
    if (name == '银行卡') {
      Get.toNamed(Routes.accountPreview);
    }
    if (name == '积分') {
      // Get.toNamed(Routes.naviOffset, arguments: {
      //   'title': '积分汇',
      //   'image': 'bg_jfenh',
      // });
      Get.toNamed(Routes.minePointsPage);
    }
    if (name == '优惠券') {
      Get.toNamed(Routes.naviOffset, arguments: {
        'title': '我的优惠券',
        'image': 'bg_yhuiq',
      });
    }
    if (name == '信用卡权益') {
      Get.toNamed(Routes.mineRightsPage);
      // Get.toNamed(Routes.naviOffset, arguments: {
      //   'title': '权益中心',
      //   'image': 'bg_xykqy',
      //   'navColor':  Colors.white.withOpacity(0.1),
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    StackPosition stackPosition =
        StackPosition(designWidth: 1080, designHeight: 767, deviceWidth: 1.sw);
    return GetBuilder(id: 'updateUI', builder: (BalanceLogic c) {
      return Stack(
        children: [
          Image(image: 'bg_mine_top'.png3x, width: 1.sw, fit: BoxFit.fitWidth),
          Positioned(
            top: stackPosition.getY(385),
            left: stackPosition.getX(50),
            child: Container(
              width: 80.w,
              height: 60.w,
            ).withOnTap(onTap: () => Get.toNamed(Routes.personInfoPage)),
          ),
          Positioned(
            top: stackPosition.getY(280),
            right: stackPosition.getX(40),
            child: Container(
              width: 100.w,
              height: 30.w,
            ).withOnTap(
                onTap: () => {
                      Get.toNamed(Routes.naviOffset, arguments: {
                        'title': '权益中心',
                        'image': 'bg_xykqy',
                        'navColor': Colors.white.withOpacity(0.1),
                      })
                    }),
          ),
          Positioned(
            top: stackPosition.getY(385),
            left: stackPosition.getX(330),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseText(
                  text:
                      "*${AppConfig.config.balanceLogic.memberInfo.realName.removeFirstChar()}",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                ).withOnTap(onTap: () => {Get.toNamed(Routes.personInfoPage)}),
                SizedBox(width: 10.w),
                Image(
                    image: 'ic_mine_level'.png3x,
                    width: stackPosition.getWidth(200))
              ],
            ),
          ),
          Positioned(
              top: stackPosition.getY(488),
              left: stackPosition.getX(485),
              child: BaseText(
                text: AppConfig.config.balanceLogic.memberInfo.loginTime,
                fontSize: 12.sp,
                color: const Color(0xff666666),
              )),
          Positioned(
              bottom: stackPosition.getY(60),
              left: stackPosition.getX(60),
              child: Container(
                width: 1.sw - stackPosition.getX(150),
                alignment: Alignment.center,
                child: VerticalGridView(
                  widgetBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onLongPress: () {
                        _showCustomNumberDialog(c);
                      },
                      onTap: () {
                        jumpPage(infoDataList[index]['name']);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BaseText(
                            text: getNumber(infoDataList[index]['name'], c),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          BaseText(
                            text: infoDataList[index]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp,
                                color: const Color(0xff666666)),
                          ),
                          SizedBox(
                            height: 10.w,
                          )
                        ],
                      )
                    );
                  },
                  mainHeight: 58.w,
                  itemCount: 4,
                ),
              ))
        ],
      );
    });
  }
}

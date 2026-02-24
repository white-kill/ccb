import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'scale_point_widget.dart';

/// 右边按钮类型枚举
enum RightButtonType {
  /// 更多按钮（三个点）
  more,
  
  /// 关闭按钮（X）
  close,
  
  /// 搜索按钮
  search,
  
  /// 客服按钮
  customer,
  
  /// 消息按钮
  message,
  
  /// 聊天按钮
  chat,
  
  /// 添加按钮（+）
  add,
  
  /// 自定义按钮
  custom,
}

/// 右边按钮配置类
class RightButtonConfig {
  /// 按钮类型
  final RightButtonType type;
  
  /// 图标颜色
  final Color? iconColor;
  
  /// 点击回调
  final VoidCallback? onTap;
  
  /// 自定义图标路径
  final String? iconPath;
  
  /// 自定义图标尺寸
  final double? iconWidth;
  final double? iconHeight;
  
  /// 右边距
  final double? rightPadding;
  final double? leftPadding;
  
  /// 更多按钮特有：弹出内容
  final Widget? popupContent;
  final double? popupLeft;
  final double? popupDx;
  final double? popupDy;
  final double? popupWidth;
  
  /// 添加按钮特有：自定义按钮样式
  final Widget? customButton;
  
  /// 跳转路由名称（用于customer, message等）
  final String? routeName;

  RightButtonConfig({
    required this.type,
    this.iconColor,
    this.onTap,
    this.iconPath,
    this.iconWidth,
    this.iconHeight,
    this.rightPadding,
    this.leftPadding,
    this.popupContent,
    this.popupLeft,
    this.popupDx,
    this.popupDy,
    this.popupWidth,
    this.customButton,
    this.routeName,
  });
}

/// 通用右边按钮构建器
class CommonRightButton {
  /// 根据配置列表构建右边按钮组
  static List<Widget> build(List<RightButtonConfig> configs) {
    List<Widget> buttons = [];
    
    for (var config in configs) {
      Widget? button = _buildButton(config);
      if (button != null) {
        buttons.add(button);
      }
    }
    
    return buttons;
  }

  /// 构建单个按钮
  static Widget? _buildButton(RightButtonConfig config) {
    switch (config.type) {
      case RightButtonType.more:
        return _buildMoreButton(config);
      case RightButtonType.close:
        return _buildCloseButton(config);
      case RightButtonType.search:
        return _buildSearchButton(config);
      case RightButtonType.customer:
        return _buildCustomerButton(config);
      case RightButtonType.message:
        return _buildMessageButton(config);
      case RightButtonType.chat:
        return _buildChatButton(config);
      case RightButtonType.add:
        return _buildAddButton(config);
      case RightButtonType.custom:
        return _buildCustomButton(config);
    }
  }

  /// 构建更多按钮（三个点）
  static Widget _buildMoreButton(RightButtonConfig config) {
    return ScalePointWidget(
      icColor: config.iconColor ?? Colors.black,
      content: config.popupContent,
      left: config.popupLeft,
      dx: config.popupDx,
      dy: config.popupDy,
      width: config.popupWidth,
    ).withPadding(
      right: config.rightPadding ?? 6.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建关闭按钮（X）
  static Widget _buildCloseButton(RightButtonConfig config) {
    return Icon(
      Icons.clear,
      color: config.iconColor ?? Colors.black,
    ).withOnTap(onTap: config.onTap ?? () {
      Get.back();
    }).withPadding(
      right: config.rightPadding ?? 16.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建搜索按钮
  static Widget _buildSearchButton(RightButtonConfig config) {
    return Image.asset(
      config.iconPath ?? 'assets/images/ic_mx_search@3x.png',
      width: config.iconWidth ?? 18.w,
      height: config.iconHeight ?? 18.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {},
    ).withPadding(
      right: config.rightPadding ?? 20.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建客服按钮
  static Widget _buildCustomerButton(RightButtonConfig config) {
    return Image.asset(
      config.iconPath ?? 'assets/images/ic_home_customer@3x.png',
      width: config.iconWidth ?? 22.w,
      height: config.iconHeight ?? 22.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        if (config.routeName != null) {
          Get.toNamed(config.routeName!);
        }
      },
    ).withPadding(
      right: config.rightPadding ?? 10.w,
      left: config.leftPadding ?? 16.w,
    );
  }

  /// 构建消息按钮
  static Widget _buildMessageButton(RightButtonConfig config) {
    return Image.asset(
      config.iconPath ?? 'assets/images/ic_home_message@3x.png',
      width: config.iconWidth ?? 22.w,
      height: config.iconHeight ?? 22.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        if (config.routeName != null) {
          Get.toNamed(config.routeName!);
        }
      },
    ).withPadding(
      right: config.rightPadding ?? 10.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建聊天按钮
  static Widget _buildChatButton(RightButtonConfig config) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: 30.w,
        minHeight: 30.w,
      ),
      onPressed: config.onTap,
      icon: Image.asset(
        config.iconPath ?? 'assets/images/ic_home_customer@3x.png',
        width: config.iconWidth ?? 20.w,
        height: config.iconHeight ?? 20.w,
        color: config.iconColor,
      ),
    );
  }

  /// 构建添加按钮（+）
  static Widget _buildAddButton(RightButtonConfig config) {
    return ScalePointWidget(
      btn: config.customButton ?? Image.asset(
        config.iconPath ?? 'assets/images/ic_bottom_add@3x.png',
        width: config.iconWidth ?? 20.w,
        height: config.iconHeight ?? 20.w,
        color: config.iconColor,
      ),
      content: config.popupContent,
      left: config.popupLeft ?? 80.w,
      dx: config.popupDx ?? 35.w,
      dy: config.popupDy ?? 0.w,
    );
  }

  /// 构建自定义按钮
  static Widget _buildCustomButton(RightButtonConfig config) {
    if (config.customButton != null) {
      return config.customButton!;
    }
    
    if (config.iconPath != null) {
      return Image.asset(
        config.iconPath!,
        width: config.iconWidth ?? 20.w,
        height: config.iconHeight ?? 20.w,
        color: config.iconColor,
      ).withOnTap(
        onTap: config.onTap ?? () {},
      ).withPadding(
        right: config.rightPadding ?? 16.w,
        left: config.leftPadding ?? 0,
      );
    }
    
    return SizedBox.shrink();
  }
}



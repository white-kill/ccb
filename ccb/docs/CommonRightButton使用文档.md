# CommonRightButton 使用文档（重构版）

## 设计理念
采用**枚举 + 配置**的方式，每个按钮独立定义，可以自由组合。

## 核心组件

### 1. RightButtonType 枚举
定义了8种基础按钮类型：
```dart
enum RightButtonType {
  more,      // 更多按钮（三个点）
  close,     // 关闭按钮（X）
  search,    // 搜索按钮
  customer,  // 客服按钮
  message,   // 消息按钮
  chat,      // 聊天按钮
  add,       // 添加按钮（+）
  custom,    // 自定义按钮
}
```

### 2. RightButtonConfig 配置类
每个按钮的配置参数。

### 3. CommonRightButton.build() 方法
根据配置列表构建按钮组。

---

## 基础使用

### 单个按钮
```dart
// 只显示关闭按钮
CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.close,
    iconColor: Colors.black,
  ),
])
```

### 多个按钮组合
```dart
// 更多 + 关闭按钮（最常用组合）
CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.more,
    iconColor: Colors.black,
  ),
  RightButtonConfig(
    type: RightButtonType.close,
    iconColor: Colors.black,
  ),
])
```

---

## 完整使用示例

### 示例1：changeNavPage - 更多+关闭（默认）
```dart
Get.toNamed(Routes.changeNavPage, arguments: {
  'title': '个人养老金',
  'image': 'bg_grylj',
  'rightWidget': Row(
    children: CommonRightButton.build([
      RightButtonConfig(
        type: RightButtonType.more,
        iconColor: Colors.black,
      ),
      RightButtonConfig(
        type: RightButtonType.close,
        iconColor: Colors.black,
      ),
    ]),
  ),
});
```

### 示例2：changeNavPage - 无按钮
```dart
Get.toNamed(Routes.changeNavPage, arguments: {
  'title': '建行•轻松还',
  'image': 'ic_home_gd2_view',
  'hideRightAction': true,  // 或者不传 rightWidget
  'defTitleColor': Colors.black,
});
```

### 示例3：账户明细 - 搜索+更多
```dart
@override
List<Widget>? get rightAction => CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.search,
    iconColor: Colors.black,
    onTap: () {
      Get.toNamed(Routes.detailSearchPage);
    },
  ),
  RightButtonConfig(
    type: RightButtonType.more,
    iconColor: Colors.black,
    popupContent: ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // 菜单项
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: menuItems.length,
    ),
    popupLeft: 110.w,
    popupDx: 60.w,
    popupWidth: 130.w,
  ),
]);
```

### 示例4：首页 - 客服+消息
```dart
@override
List<Widget>? get rightAction => CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.customer,
    iconColor: logic.navActionColor.value,
    routeName: Routes.customerPage,
  ),
  RightButtonConfig(
    type: RightButtonType.message,
    iconColor: logic.navActionColor.value,
    routeName: Routes.mineMessagePage,
  ),
]);
```

### 示例5：账户查询 - 聊天+添加
```dart
@override
List<Widget>? get rightAction => CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.chat,
    iconColor: Colors.white,
    onTap: () {
      Get.toNamed(Routes.ccbCustomerPage);
    },
  ),
  RightButtonConfig(
    type: RightButtonType.add,
    iconColor: Colors.white,
    popupContent: addDialogContent,
    popupLeft: 80.w,
    popupDx: 35.w,
  ),
]);
```

### 示例6：自定义按钮
```dart
CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.custom,
    iconPath: 'assets/new_images/custom_icon.png',
    iconWidth: 24.w,
    iconHeight: 24.w,
    iconColor: Colors.blue,
    onTap: () {
      // 自定义逻辑
    },
  ),
])
```

### 示例7：完全自定义Widget
```dart
CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.custom,
    customButton: Text('保存', style: TextStyle(color: Colors.blue)),
  ),
])
```

---

## 配置参数详解

### 通用参数（所有按钮类型）
```dart
RightButtonConfig({
  required type,        // 按钮类型（必填）
  iconColor,           // 图标颜色
  onTap,               // 点击回调
  iconPath,            // 自定义图标路径
  iconWidth,           // 图标宽度
  iconHeight,          // 图标高度
  rightPadding,        // 右边距
  leftPadding,         // 左边距
})
```

### more 按钮特有参数
```dart
popupContent,  // 弹出菜单的内容 Widget
popupLeft,     // 弹出位置距左边距离
popupDx,       // X轴偏移
popupDy,       // Y轴偏移
popupWidth,    // 弹出菜单宽度
```

### add 按钮特有参数
```dart
customButton,  // 自定义按钮样式
popupContent,  // 弹出菜单内容
popupLeft,     // 弹出位置
popupDx,       // X轴偏移
popupDy,       // Y轴偏移
```

### customer/message 按钮特有参数
```dart
routeName,  // 跳转的路由名称
```

---

## 常用组合速查表

| 组合 | 代码 | 适用场景 |
|------|------|---------|
| 更多+关闭 | `[more, close]` | changeNavPage, fixedNavPage (90%页面) |
| 只有更多 | `[more]` | 部分展示页 |
| 只有关闭 | `[close]` | 简单展示页 |
| 搜索+更多 | `[search, more]` | account_details, detaild_info |
| 客服+消息 | `[customer, message]` | 首页 |
| 聊天+添加 | `[chat, add]` | account_preview |
| 无按钮 | `[]` 或 `hideRightAction: true` | 纯展示页 |

---

## 实际项目使用示例

### 场景1：批量转账（白色图标）
```dart
Get.toNamed(Routes.changeNavPage, arguments: {
  'title': '批量转账',
  'image': 'bg_plzz',
  'navColor': const Color(0xff3C6DD3),
  'titleColor': Colors.white,
  'rightWidget': Row(
    children: CommonRightButton.build([
      RightButtonConfig(
        type: RightButtonType.more,
        iconColor: Colors.white,
      ),
      RightButtonConfig(
        type: RightButtonType.close,
        iconColor: Colors.white,
      ),
    ]),
  ),
});
```

### 场景2：首页（响应式颜色）
```dart
@override
List<Widget>? get rightAction => Obx(() => Row(
  children: CommonRightButton.build([
    RightButtonConfig(
      type: RightButtonType.customer,
      iconColor: logic.navActionColor.value,
      routeName: Routes.customerPage,
    ),
    RightButtonConfig(
      type: RightButtonType.message,
      iconColor: logic.navActionColor.value,
      routeName: Routes.mineMessagePage,
    ),
  ]),
)).toList();
```

### 场景3：详情页（带菜单的更多按钮）
```dart
CommonRightButton.build([
  RightButtonConfig(
    type: RightButtonType.more,
    iconColor: Colors.black,
    popupContent: Column(
      children: [
        ListTile(
          leading: Icon(Icons.share),
          title: Text('分享'),
          onTap: () => share(),
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('编辑'),
          onTap: () => edit(),
        ),
      ],
    ),
    popupLeft: 100.w,
    popupWidth: 150.w,
  ),
])
```

---

## 在 changeNavPage 和 fixedNavPage 中的使用

### 优先级规则
1. **最高优先级：** `rightWidget` 参数
2. **次优先级：** `hideRightAction: true` 
3. **默认：** 更多 + 关闭按钮

### 配置方式对比

```dart
// 方式1：使用 rightWidget（推荐，最灵活）
Get.toNamed(Routes.changeNavPage, arguments: {
  'title': '标题',
  'image': 'image_name',
  'rightWidget': Row(
    children: CommonRightButton.build([...]),
  ),
});

// 方式2：隐藏按钮
Get.toNamed(Routes.changeNavPage, arguments: {
  'title': '标题',
  'image': 'image_name',
  'hideRightAction': true,
});

// 方式3：使用默认按钮
Get.toNamed(Routes.changeNavPage, arguments: {
  'title': '标题',
  'image': 'image_name',
  // 自动显示更多+关闭按钮
});
```

---

## 优势

### ✅ 更灵活
- 每个按钮独立配置
- 可以任意组合
- 易于添加新按钮类型

### ✅ 更易维护
- 按钮样式集中管理
- 修改一处，全局生效
- 代码更简洁

### ✅ 更易扩展
- 添加新按钮只需在枚举中新增
- 实现对应的 `_build` 方法即可

### ✅ 类型安全
- 使用枚举，IDE有提示
- 编译时检查，避免错误

---

## 扩展示例

### 添加新按钮类型
```dart
// 1. 在枚举中添加
enum RightButtonType {
  // ... 现有类型
  share,  // 新增：分享按钮
}

// 2. 在 CommonRightButton 中添加构建方法
static Widget _buildShareButton(RightButtonConfig config) {
  return Image.asset(
    config.iconPath ?? 'assets/new_images/share.png',
    width: config.iconWidth ?? 20.w,
    height: config.iconHeight ?? 20.w,
    color: config.iconColor,
  ).withOnTap(
    onTap: config.onTap ?? () {},
  ).withPadding(
    right: config.rightPadding ?? 16.w,
  );
}

// 3. 在 switch 中添加 case
case RightButtonType.share:
  return _buildShareButton(config);
```

---

## 总结

新设计通过**枚举 + 配置**的方式实现了：
- 🎯 **按钮独立化**：每个按钮独立定义和配置
- 🔧 **自由组合**：通过列表灵活组合任意按钮
- 📦 **易于维护**：集中管理所有按钮样式
- 🚀 **易于扩展**：添加新按钮类型非常简单

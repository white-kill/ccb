# TextStyleUnit 使用说明

## 概述
`TextStyleUnit` 是一个文本样式工具类，提供项目中常用的文本样式，统一使用 PingFang SC 字体。

## 基本使用

### 1. 标题样式
```dart
Text('标题大', style: TextStyleUnit.titleLarge)
Text('标题中', style: TextStyleUnit.titleMedium)
Text('标题小', style: TextStyleUnit.titleSmall)
```

### 2. 正文样式
```dart
Text('正文大', style: TextStyleUnit.bodyLarge)
Text('正文中', style: TextStyleUnit.bodyMedium)
Text('正文小', style: TextStyleUnit.bodySmall)
```

### 3. 标签样式
```dart
Text('标签大', style: TextStyleUnit.labelLarge)
Text('标签中', style: TextStyleUnit.labelMedium)
Text('标签小', style: TextStyleUnit.labelSmall)
```

### 4. 特殊样式
```dart
Text('说明文字', style: TextStyleUnit.caption)
Text('上划线文字', style: TextStyleUnit.overline)
Text('按钮文字', style: TextStyleUnit.button)
Text('链接文字', style: TextStyleUnit.link)
```

### 5. 状态样式
```dart
Text('强调文字', style: TextStyleUnit.emphasis)
Text('次要文字', style: TextStyleUnit.secondary)
Text('辅助文字', style: TextStyleUnit.helper)
Text('错误文字', style: TextStyleUnit.error)
Text('成功文字', style: TextStyleUnit.success)
Text('警告文字', style: TextStyleUnit.warning)
```

### 6. 权重样式
```dart
Text('超细体', style: TextStyleUnit.ultralight)
Text('细体', style: TextStyleUnit.thin)
Text('轻体', style: TextStyleUnit.light)
Text('常规', style: TextStyleUnit.regular)
Text('中等', style: TextStyleUnit.medium)
Text('半粗', style: TextStyleUnit.semibold)
```

## 自定义样式

### 1. 使用 custom 方法
```dart
Text('自定义样式', style: TextStyleUnit.custom(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: Colors.blue,
  letterSpacing: 1.2,
))
```

### 2. 使用 getWeight 方法
```dart
Text('自定义权重', style: TextStyleUnit.getWeight(
  FontWeight.w500,
  fontSize: 16,
  color: Colors.purple,
))
```

## 样式参数说明

### 字体大小
- 使用 `flutter_screenutil` 进行响应式适配
- 通过 `.sp` 后缀自动适配不同屏幕尺寸

### 字体权重
- `FontWeight.w100` - 超细体 (Ultralight)
- `FontWeight.w200` - 细体 (Thin)
- `FontWeight.w300` - 轻体 (Light)
- `FontWeight.w400` - 常规 (Regular)
- `FontWeight.w500` - 中等 (Medium)
- `FontWeight.w600` - 半粗 (Semibold)

### 颜色
- `Colors.black87` - 主要文本颜色
- `Colors.black54` - 次要文本颜色
- `Colors.black45` - 辅助文本颜色
- `Colors.red` - 错误文本颜色
- `Colors.green` - 成功文本颜色
- `Colors.orange` - 警告文本颜色
- `Colors.blue` - 链接文本颜色

## 最佳实践

1. **统一使用**：项目中所有文本样式都应使用 `TextStyleUnit`
2. **语义化命名**：根据文本的用途选择合适的样式
3. **响应式设计**：字体大小会自动适配不同屏幕
4. **颜色一致性**：使用预定义的颜色保持界面一致性

## 示例页面
运行 `TextStyleExample` 页面可以查看所有样式的效果。 
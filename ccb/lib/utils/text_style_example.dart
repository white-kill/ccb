import 'package:flutter/material.dart';
import 'text_style_unit.dart';

/// 文本样式使用示例
class TextStyleExample extends StatelessWidget {
  const TextStyleExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本样式示例', style: TextStyleUnit.titleMedium),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题样式
            Text('标题大', style: TextStyleUnit.titleLarge),
            const SizedBox(height: 8),
            Text('标题中', style: TextStyleUnit.titleMedium),
            const SizedBox(height: 8),
            Text('标题小', style: TextStyleUnit.titleSmall),
            const SizedBox(height: 16),

            // 正文样式
            Text('正文大', style: TextStyleUnit.bodyLarge),
            const SizedBox(height: 8),
            Text('正文中', style: TextStyleUnit.bodyMedium),
            const SizedBox(height: 8),
            Text('正文小', style: TextStyleUnit.bodySmall),
            const SizedBox(height: 16),

            // 标签样式
            Text('标签大', style: TextStyleUnit.labelLarge),
            const SizedBox(height: 8),
            Text('标签中', style: TextStyleUnit.labelMedium),
            const SizedBox(height: 8),
            Text('标签小', style: TextStyleUnit.labelSmall),
            const SizedBox(height: 16),

            // 特殊样式
            Text('说明文字', style: TextStyleUnit.caption),
            const SizedBox(height: 8),
            Text('上划线文字', style: TextStyleUnit.overline),
            const SizedBox(height: 8),
            Text('按钮文字', style: TextStyleUnit.button),
            const SizedBox(height: 8),
            Text('链接文字', style: TextStyleUnit.link),
            const SizedBox(height: 16),

            // 状态样式
            Text('强调文字', style: TextStyleUnit.emphasis),
            const SizedBox(height: 8),
            Text('次要文字', style: TextStyleUnit.secondary),
            const SizedBox(height: 8),
            Text('辅助文字', style: TextStyleUnit.helper),
            const SizedBox(height: 8),
            Text('错误文字', style: TextStyleUnit.error),
            const SizedBox(height: 8),
            Text('成功文字', style: TextStyleUnit.success),
            const SizedBox(height: 8),
            Text('警告文字', style: TextStyleUnit.warning),
            const SizedBox(height: 16),

            // 权重样式
            Text('超细体', style: TextStyleUnit.ultralight),
            const SizedBox(height: 8),
            Text('细体', style: TextStyleUnit.thin),
            const SizedBox(height: 8),
            Text('轻体', style: TextStyleUnit.light),
            const SizedBox(height: 8),
            Text('常规', style: TextStyleUnit.regular),
            const SizedBox(height: 8),
            Text('中等', style: TextStyleUnit.medium),
            const SizedBox(height: 8),
            Text('半粗', style: TextStyleUnit.semibold),
            const SizedBox(height: 16),

            // 自定义样式
            Text('自定义样式',
                style: TextStyleUnit.custom(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  letterSpacing: 1.2,
                )),
            const SizedBox(height: 8),
            Text('自定义权重',
                style: TextStyleUnit.getWeight(
                  FontWeight.w500,
                  fontSize: 16,
                  color: Colors.purple,
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OutsideLabelDonutChart extends StatelessWidget {
  final double totalValue;
  final Map<String, double> data;

  const OutsideLabelDonutChart({
    super.key,
    required this.totalValue,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final List<PieChartSectionData> sections = _buildSections();

    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          sections: sections,
          centerSpaceRadius: 60, // 圆环中心空白半径
          sectionsSpace: 0,       // 扇形间隔
          startDegreeOffset: -90, // 从顶部开始绘制
          pieTouchData: PieTouchData(enabled: true),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    final List<PieChartSectionData> result = [];
    final colors = [Colors.blue, Colors.green, Colors.orange];
    int index = 0;

    data.forEach((label, value) {
      result.add(
        PieChartSectionData(
          value: value,
          color: colors[index % colors.length],
          radius: 25,
          showTitle: false,
          badgeWidget: _OutsideLabel(label: label, value: value),
          badgePositionPercentageOffset: 1.4, // 控制标签外移距离
        ),
      );
      index++;
    });

    return result;
  }
}

class _OutsideLabel extends StatelessWidget {
  final String label;
  final double value;

  const _OutsideLabel({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${value.toStringAsFixed(1)}%',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'more_logic.dart';
import 'more_state.dart';

class MoreGroupSection extends StatefulWidget {
  const MoreGroupSection({super.key});

  @override
  State<MoreGroupSection> createState() => _MoreGroupSectionState();
}

class _MoreGroupSectionState extends State<MoreGroupSection> {
  final MoreLogic logic = Get.find<MoreLogic>();
  final MoreState state = MoreState();
  final ScrollController _scrollController = ScrollController();
  
  // 记录每个分组的高度
  final Map<int, double> _groupHeights = {};
  double _totalHeight = 0;
  
  // 添加标志位，标记是否是通过点击导航触发的滚动
  bool _isScrollingFromTap = false;

  @override
  void initState() {
    super.initState();
    state.groupKeys = List.generate(logic.groupData.length, (index) => GlobalKey());
    // 在下一帧计算高度
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateGroupHeights();
    });
  }

  void _calculateGroupHeights() {
    double totalHeight = 0;
    for (int i = 0; i < state.groupKeys.length; i++) {
      final context = state.groupKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        _groupHeights[i] = box.size.height;
        totalHeight += box.size.height;
      }
    }
    _totalHeight = totalHeight;
  }

  void _scrollToGroup(int index) {
    if (index >= logic.groupData.length) return;
    
    setState(() {
      state.selectedGroup = index;
    });

    // 标记开始通过点击导航进行滚动
    _isScrollingFromTap = true;

    // 计算目标滚动位置
    double targetOffset = 0;
    for (int i = 0; i < index; i++) {
      targetOffset += _groupHeights[i] ?? 0;
    }

    // 使用 ScrollController 进行滚动
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    ).then((_) {
      // 滚动结束后重置标志位
      _isScrollingFromTap = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                // 左侧锚点导航
                Container(
                  width: 70.w,
                  color: Colors.white,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 27),
                    itemCount: logic.groupList.length,
                    itemBuilder: (context, index) {
                      final isSelected = state.selectedGroup == index;
                      return InkWell(
                        onTap: () => _scrollToGroup(index),
                        child: Container(
                          height: 48.w,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                logic.groupList[index],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: isSelected
                                      ? const Color(0xFF1A40B5)
                                      : Colors.black87,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              if (isSelected)
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: SizedBox(
                                    height: 5,
                                    width: 15,
                                    child: CustomPaint(
                                      painter: CurvedUnderlinePainter(
                                          color: Color(0xFF1A40B5)),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // 右侧分组内容
// 右侧分组内容
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      if (_isScrollingFromTap) return false;

                      // 检查是否接近底部
                      if (notification is ScrollUpdateNotification) {
                        final metrics = notification.metrics;

                        // 当滚动到 80% 以上时，强制选中最后一项
                        if (metrics.pixels >= metrics.maxScrollExtent - 100) {
                          if (state.selectedGroup != state.groupKeys.length - 1) {
                            setState(() {
                              state.selectedGroup = state.groupKeys.length - 1;
                            });
                          }
                          return false;
                        }


                        // 原有的滚动位置检测逻辑
                        for (int i = 0; i < state.groupKeys.length; i++) {
                          final keyContext = state.groupKeys[i].currentContext;
                          if (keyContext != null) {
                            final box = keyContext.findRenderObject() as RenderBox;
                            final offset = box.localToGlobal(Offset.zero);
                            if (offset.dy > 100 && offset.dy < 300) {
                              if (state.selectedGroup != i) {
                                setState(() {
                                  state.selectedGroup = i;
                                });
                              }
                              break;
                            }
                          }
                        }
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        color: Color(0xFFFEFEFE),
                        padding: EdgeInsets.only(top: 0, bottom: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(logic.groupData.length, (groupIdx) {
                            final group = logic.groupData[groupIdx];
                            return Container(
                              key: state.groupKeys[groupIdx],
                              padding: EdgeInsets.only(
                                  left: 16.w,
                                  right: 16.w,
                                  top: 24.w,
                                  bottom: 16.w
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (group['mode'] == 'section' &&
                                      group['image'] != null)
                                    Center(
                                      child: Image.asset(
                                        group['image'],
                                        fit: BoxFit.fitWidth,
                                      ),
                                    )
                                  else
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          group['title'],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 12.w),
                                        Padding(
                                          padding: EdgeInsets.only(left: 7.w),
                                          child: Wrap(
                                            spacing: 32.w,
                                            runSpacing: 18.w,
                                            children: List.generate(
                                                (group['items'] as List).length,
                                                    (itemIdx) {
                                                  final item = group['items'][itemIdx];
                                                  return InkWell(
                                                    onTap: () {
                                                      final logic = Get.find<MoreLogic>();
                                                      logic.handleItemClick(item['label']);
                                                    },
                                                    child: SizedBox(
                                                      width: 60.w,
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                            'assets/new_images/home/more/${item['icon']}.png',
                                                            width: 25.w,
                                                            height: 25.w,
                                                          ),
                                                          SizedBox(height: 6.w),
                                                          Text(
                                                            item['label'],
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color: Colors.black87
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurvedUnderlinePainter extends CustomPainter {
  final Color color;
  CurvedUnderlinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width / 2, size.height, // 控制点在底部中间
      size.width, size.height * 0.2,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

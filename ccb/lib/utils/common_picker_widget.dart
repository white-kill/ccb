import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonPickerItem {
  final String title;
  final dynamic value;

  CommonPickerItem({required this.title, this.value});
}

class CommonPickerWidget extends StatelessWidget {
  final String? title;
  final List<CommonPickerItem> items;
  final CommonPickerItem? selectedItem;
  final Function(CommonPickerItem) onItemSelected;
  final bool showDivider;
  final bool showArrow;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  const CommonPickerWidget({
    Key? key,
    this.title,
    required this.items,
    this.selectedItem,
    required this.onItemSelected,
    this.showDivider = true,
    this.showArrow = true,
    this.contentPadding,
    this.titleStyle,
    this.valueStyle,
  }) : super(key: key);

  void show() async {
    _showPickerDialog(Get.context!);
  }

  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xFF1460DA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[200]!,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: 24, color: Colors.white,),
                ),
                Text(
                  title ?? '请选择',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 2
                  ),
                ),
                SizedBox(width: 50,)
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = selectedItem?.value == item.value;
                return InkWell(
                  onTap: () {
                    onItemSelected(item);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue[50] : Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[200]!,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: isSelected ? Colors.blue : Colors.black.withAlpha(150),
                          ),
                        ),
                        // if (isSelected)
                        //   Icon(
                        //     Icons.check,
                        //     color: Colors.blue,
                        //     size: 20.r,
                        //   ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showPickerDialog(context),
      child: Container(
        padding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: showDivider
              ? Border(
                  bottom: BorderSide(
                    color: Colors.grey[200]!,
                    width: 0.5,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            if (title != null)
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Text(
                  title!,
                  style: titleStyle ??
                      TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                ),
              ),
            Expanded(
              child: Text(
                selectedItem?.title ?? '请选择',
                style: valueStyle ??
                    TextStyle(
                      fontSize: 14.sp,
                      color: selectedItem != null
                          ? Colors.black87
                          : Colors.grey[400],
                    ),
                textAlign: title != null ? TextAlign.right : TextAlign.left,
              ),
            ),
            if (showArrow)
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 20.r,
                  color: Colors.grey[400],
                ),
              ),
          ],
        ),
      ),
    );
  }
} 
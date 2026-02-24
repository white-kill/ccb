import 'package:flutter/material.dart';

class IOSStyleDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final double? width;
  final double? height;
  final Color confirmColor;
  final bool showCancelButton;
  final bool showTitle;
  final TextAlign contentAlignment;

  const IOSStyleDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText = '确认',
    this.cancelText = '取消',
    this.width,
    this.height,
    this.confirmColor = Colors.blue,
    this.showCancelButton = true,
    this.showTitle = true,
    this.contentAlignment = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: UnconstrainedBox(
        child: Container(
          width: width ?? screenSize.width * 0.75,
          height: height?? screenSize.height * 0.8,
          constraints: BoxConstraints(
            maxWidth: screenSize.width ,
            minWidth: 200,
            minHeight: 150,
            maxHeight: screenSize.height ,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showTitle) ...[
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                      Text(
                        content,
                        textAlign: contentAlignment,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(height: 1, color: Colors.grey[200]),
              _buildBottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (showCancelButton) ...[
            _buildButton(
              text: cancelText,
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Container(width: 1, color: Colors.grey[200]),
          ],
          _buildButton(
            text: confirmText,
            color: confirmColor,
            borderRadius: showCancelButton
                ? const BorderRadius.only(bottomRight: Radius.circular(14))
                : const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required BorderRadius borderRadius,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Material(
        color: Colors.white,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(
            height: 44,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
                color: color,
                fontWeight:  FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class AlterWidget {

  static alterWidget({required Widget Function(BuildContext context) builder}){
    SmartDialog.show(
      usePenetrate: false,
      clickMaskDismiss: false,
      builder:builder,
    );
  }

}
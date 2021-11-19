import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final String message;

  // コンストラクトでメッセージを子 Widget を取る
  MyInheritedWidget({required this.message, required Widget child})
    : super(child: child);

  // 0(1)で InheritedWidget を返却
  static MyInheritedWidget of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
      as MyInheritedWidget;

  // 更新されたかどうかの判定ロジック
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) =>
    oldWidget.message != message;
}

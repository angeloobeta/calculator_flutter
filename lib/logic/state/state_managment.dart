import 'package:flutter/material.dart';

class MainState extends InheritedWidget {
  MainState(
      {Key? key,
      required Widget child,
      this.inputValue,
      this.preValue,
      this.value,
      this.operator,
      this.onPressed})
      : super(child: child);
  final String? inputValue;
  final double? preValue;
  final String? value;
  final String? operator;
  final Function? onPressed;

  static MainState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainState>();
  }

  @override
  bool updateShouldNotify(MainState oldWidget) {
    return inputValue != oldWidget.inputValue;
  }
}

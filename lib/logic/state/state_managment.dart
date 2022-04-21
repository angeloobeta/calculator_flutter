import 'package:flutter/material.dart';

class MainState extends InheritedWidget {
  MainState(
      {Key? key,
      required Widget child,
      required this.inputValue,
      required this.preValue,
      required this.value,
      required this.operator,
      required this.onPressed})
      : super(child: child);
  final String? inputValue;
  final double? preValue;
  final String? value;
  late String operator;
  final Function? onPressed;

  static MainState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainState>();
  }

  @override
  bool updateShouldNotify(MainState oldWidget) {
    return inputValue != oldWidget.inputValue;
  }
}

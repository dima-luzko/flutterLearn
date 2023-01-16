import 'package:flutter/cupertino.dart';

class CountState extends InheritedWidget {
  final int count;
  final int global;
  final Function incrementer;
  final Function decrementer;

  const CountState(
      {Key? key,
      required this.count,
      required this.global,
      required Widget child,
      required this.incrementer,
      required this.decrementer})
      : super(key: key, child: child);

  static  of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountState>();
  }

  @override
  bool updateShouldNotify(CountState oldWidget) {
    return count != oldWidget.count;
  }
}

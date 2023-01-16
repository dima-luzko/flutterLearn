import 'package:flutter/cupertino.dart';

class CountStateWidget extends InheritedWidget {
  final int count;
  final int global;
  final Function incrementer;
  final Function decrementer;

  const CountStateWidget(
      {Key? key,
      required this.count,
      required this.global,
      required Widget child,
      required this.incrementer,
      required this.decrementer})
      : super(key: key, child: child);

  static  of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountStateWidget>();
  }

  @override
  bool updateShouldNotify(CountStateWidget oldWidget) {
    return count != oldWidget.count;
  }
}
